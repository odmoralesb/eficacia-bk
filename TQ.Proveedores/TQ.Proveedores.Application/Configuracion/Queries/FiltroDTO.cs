namespace TQ.Proveedores.Application.Configuracion.Queries
{
    public class OptionDTO
    {
        public string Label { get; set; }
        public string Value { get; set; }
        public bool? Selected { get; set; }
    }

    public class OptionMWDTO
    {
        public string Id { get; set; }
        public string Value { get; set; }
    }

    public class FiltroDTO
    {
        public string Label { get; set; }
        public string Key { get; set; }
        public bool Multiple { get; set; }
        public OptionDTO[] Options { get; set; }

    }
}
