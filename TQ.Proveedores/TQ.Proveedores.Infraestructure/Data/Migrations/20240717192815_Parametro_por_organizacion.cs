using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TQ.Proveedores.Infraestructure.Migrations
{
    public partial class Parametro_por_organizacion : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "OrganizacionId",
                table: "EP_Parametro",
                type: "int",
                nullable: false,
                defaultValue: 155);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "OrganizacionId",
                table: "EP_Parametro");
        }
    }
}
