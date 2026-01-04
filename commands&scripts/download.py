import os
import yt_dlp

def download_playlist(playlist_url, output_path):
    # Configurações do yt-dlp
    ydl_opts = {
        'format': 'bestvideo[height<=1080]+bestaudio/best[height<=1080]',  # Escolhe a melhor qualidade disponível
        'outtmpl': os.path.join(output_path, '%(title)s.%(ext)s'),  # Define o caminho e o nome do arquivo
        'ignoreerrors': True,  # Ignora erros e continua o download da playlist
        'yesplaylist': True,  # Força o download da playlist mesmo que o URL seja de um único vídeo
         # Pós-processador para REMOVER o áudio (opcional)
        'postprocessors': [{
            'key': 'FFmpegVideoConvertor',
            'preferedformat': 'mp4',
        }],
    }

    # Cria a pasta de saída se não existir
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # Inicia o download da playlist
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([playlist_url])

if __name__ == "__main__":
    # URL da playlist do YouTube
    playlist_url = input("Cole a URL da playlist/video do YouTube: ")

    # Caminho da pasta onde os vídeos serão salvos
    output_path = input("Digite o caminho da pasta de destino (ex: ./videos): ")

    # Chama a função para baixar a playlist
    download_playlist(playlist_url, output_path)