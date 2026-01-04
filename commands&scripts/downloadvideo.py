import os
import yt_dlp

def download_video_only(playlist_url, output_path, video_format='mp4'):
    ydl_opts = {
        # Formato: Melhor vídeo (sem áudio) no formato escolhido
        'format': f'bestvideo[ext={video_format}]+bestaudio[ext=m4a]/best[ext={video_format}]',
        'outtmpl': os.path.join(output_path, '%(title)s.%(ext)s'),
        'ignoreerrors': True,
        'yesplaylist': True,
        # Pós-processador para REMOVER o áudio (opcional)
        'postprocessors': [{
            'key': 'FFmpegVideoConvertor',
            'preferedformat': video_format,  # Converte para o formato desejado
        }],
    }

    if not os.path.exists(output_path):
        os.makedirs(output_path)

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([playlist_url])

if __name__ == "__main__":
    playlist_url = input("URL da playlist/vídeo: ")
    output_path = input("Pasta de destino (ex: ./videos): ")
    video_format = input("Formato do vídeo (mp4/webm): ").lower()

    if video_format not in ['mp4', 'webm']:
        print("Formato inválido! Use 'mp4' ou 'webm'.")
    else:
        download_video_only(playlist_url, output_path, video_format)