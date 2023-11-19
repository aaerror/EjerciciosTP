namespace ParcialTP2
{
    public class Archivo 
    {
        public string Name { get; private set; } = string.Empty;
        public string Path { get; private set; } = string.Empty;
        public string Extension { get; private set; } = string.Empty;


        public Archivo(string name, string path, string extension)
        {
            Name = name;
            Path = path;
            Extension = extension;
        }
    }
}