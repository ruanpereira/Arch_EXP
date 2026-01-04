import os
import subprocess
import sys

def criar_playlist_m3u(url_playlist, diretorio_saida):
    """
    Baixa uma playlist do YouTube com metadados e thumbnails,
    e depois cria um arquivo .m3u.
    Usa cookies do navegador para autenticar em vídeos com restrição de idade.
    """
    # Garante que o diretório de saída exista
    if not os.path.exists(diretorio_saida):
        print(f"Criando o diretório: {diretorio_saida}")
        os.makedirs(diretorio_saida)

    print("\n--- Iniciando o download da playlist ---")
    print(f"URL: {url_playlist}")
    print(f"Salvando em: {diretorio_saida}")
    print("Usando cookies do navegador para autenticação.")

    # Comando para o yt-dlp
    comando_yt_dlp = [
        'yt-dlp',
        '--cookies',
        'cookies.firefox-private.txt',
        '-x',
        '--audio-format', 'mp3',
        '--embed-metadata',
        '--embed-thumbnail',
        '--audio-quality', '320K',
        '--output', os.path.join(diretorio_saida, '%(playlist_index)s - %(title)s.%(ext)s'),
        '--yes-playlist',
        url_playlist
    ]

    try:
        subprocess.run(comando_yt_dlp, check=True)
        print("\n--- Download concluído com sucesso! ---")
    except FileNotFoundError:
        print("\nERRO: O comando 'yt-dlp' não foi encontrado.")
        sys.exit(1)
    except subprocess.CalledProcessError as e:
        print(f"\nERRO: Ocorreu um erro ao executar o yt-dlp.")
        print(e)
        sys.exit(1)

    # --- Passo 2: Criar o arquivo .m3u ---
    print("\n--- Criando o arquivo de playlist .m3u ---")
    try:
        def sort_key(f):
            try: return int(f.split(' ')[0])
            except (ValueError, IndexError): return float('inf')

        arquivos_musica = sorted(
            [f for f in os.listdir(diretorio_saida) if f.endswith('.mp3')],
            key=sort_key
        )

        if not arquivos_musica:
            print("Nenhum arquivo .mp3 encontrado. O arquivo .m3u não será criado.")
            return

        nome_playlist = os.path.basename(diretorio_saida)
        caminho_m3u = os.path.join(diretorio_saida, f"{nome_playlist}.m3u")

        with open(caminho_m3u, 'w', encoding='utf-8') as f:
            f.write("#EXTM3U\n\n")
            for arquivo in arquivos_musica:
                f.write(f"{arquivo}\n")

        print(f"Playlist '{caminho_m3u}' criada com sucesso com {len(arquivos_musica)} músicas.")
    except Exception as e:
        print(f"Ocorreu um erro ao criar o arquivo .m3u: {e}")

if __name__ == "__main__":
    print("=== Criador de Playlist .m3u a partir do YouTube ===")
    playlist_url = input("Insira a URL da playlist do YouTube: ")
    if not playlist_url:
        print("URL inválida. Encerrando.")
        sys.exit(1)

    output_dir = input("Insira o nome da pasta para salvar as músicas: ")
    if not output_dir:
        print("Nome do diretório inválido. Encerrando.")
        sys.exit(1)
        
    criar_playlist_m3u(playlist_url, output_dir)
