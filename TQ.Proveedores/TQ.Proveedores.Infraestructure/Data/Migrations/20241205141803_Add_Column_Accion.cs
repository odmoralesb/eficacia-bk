using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TQ.Proveedores.Infraestructure.Data.Migrations
{
    public partial class Add_Column_Accion : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Accion",
                table: "EP_PlanAccion",
                type: "nvarchar(1500)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Accion",
                table: "EP_PlanAccion");
        }
    }
}
