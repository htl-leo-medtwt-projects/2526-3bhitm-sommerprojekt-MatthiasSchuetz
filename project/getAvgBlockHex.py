from PIL import Image
import os


base_dir = os.path.dirname(os.path.abspath(__file__))
input_folder = os.path.join(base_dir, "server/media/blocks")
output_file = os.path.join(base_dir, "farben.txt")

def average_hex(image_path):
    img = Image.open(image_path).convert("RGB")
    
    img = img.resize((1, 1), resample=Image.BOX)
    r, g, b = img.getpixel((0, 0))
    
    return f"#{r:02x}{g:02x}{b:02x}"

with open(output_file, "w") as f:
    for file in os.listdir(input_folder):
        if file.endswith(".png"):
            path = os.path.join(input_folder, file)
            hex_color = average_hex(path)
            
            f.write(f"{file}     {hex_color}\n")

print("Fertig! Datei gespeichert als", output_file)