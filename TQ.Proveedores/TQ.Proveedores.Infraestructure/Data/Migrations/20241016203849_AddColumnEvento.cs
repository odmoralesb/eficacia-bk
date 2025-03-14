using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TQ.Proveedores.Infraestructure.Data.Migrations
{
    public partial class AddColumnEvento : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Estado",
                table: "EP_Evento",
                type: "int",
                nullable: false,
                defaultValue: 1);

            migrationBuilder.AddColumn<string>(
                name: "NumLote",
                table: "EP_Evento",
                type: "nvarchar(80)",
                maxLength: 80,
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Estado",
                table: "EP_Evento");

            migrationBuilder.DropColumn(
                name: "NumLote",
                table: "EP_Evento");
        }
    }
}
