import os
import yt_dlp

def download_playlist(playlist_url, output_path, file_format):
    # Configurações do yt-dlp baseadas no formato escolhido
    if file_format == 'mp4':
        ydl_opts = {
            'format': 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best',  # Melhor qualidade MP4
            'outtmpl': os.path.join(output_path, '%(title)s.%(ext)s'),  # Define o caminho e o nome do arquivo
            'ignoreerrors': True,  # Ignora erros e continua o download da playlist
            'yesplaylist': True,  # Força o download da playlist mesmo que o URL seja de um único vídeo
            'writethumbnail': True,  # Baixa a thumbnail do vídeo
            'postprocessors': [
                {
                    'key': 'EmbedThumbnail',  # Insere a thumbnail no arquivo de vídeo
                },
                {
                    'key': 'FFmpegMetadata',  # Adiciona metadados ao arquivo
                },
            ],
        }
    elif file_format in ['mp3', 'wma']:
        ydl_opts = {
            'format': 'bestaudio/best',  # Melhor qualidade de áudio
            'outtmpl': os.path.join(output_path, '%(title)s.%(ext)s'),  # Define o caminho e o nome do arquivo
            'writethumbnail': True,  # Baixa a thumbnail do vídeo
            'postprocessors': [
                {
                    'key': 'FFmpegExtractAudio',  # Extrai o áudio
                    'preferredcodec': file_format,  # Escolhe o formato de áudio (mp3 ou wma)
                    'preferredquality': '192',  # Qualidade do áudio (192 kbps)
                },
                {
                    'key': 'EmbedThumbnail',  # Insere a thumbnail no arquivo de áudio
                },
                {
                    'key': 'FFmpegMetadata',  # Adiciona metadados ao arquivo
                },
            ],
            'ignoreerrors': True,  # Ignora erros e continua o download da playlist
            'yesplaylist': True,  # Força o download da playlist mesmo que o URL seja de um único vídeo
        }
    else:
        print("Formato não suportado. Escolha entre mp4, mp3 ou wma.")
        return

    # Cria a pasta de saída se não existir
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # Inicia o download da playlist
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([playlist_url])

if __name__ == "__main__":
    # URL da playlist do YouTube
    playlist_url = input("Cole a URL da playlist do YouTube: ")

    # Caminho da pasta onde os arquivos serão salvos
    output_path = input("Digite o caminho da pasta de destino (ex: ./videos): ")

    # Escolha do formato de arquivo
    file_format = input("Escolha o formato de arquivo (mp4, mp3 ou wma): ").lower()

    # Verifica se o formato é válido
    if file_format not in ['mp4', 'mp3', 'wma']:
        print("Formato inválido. Escolha entre mp4, mp3 ou wma.")
    else:
        # Chama a função para baixar a playlist
        download_playlist(playlist_url, output_path, file_format)