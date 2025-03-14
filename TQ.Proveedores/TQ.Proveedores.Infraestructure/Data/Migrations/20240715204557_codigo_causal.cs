using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TQ.Proveedores.Infraestructure.Migrations
{
    public partial class codigo_causal : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Nombre",
                table: "EP_Causal",
                type: "nvarchar(80)",
                maxLength: 80,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(30)",
                oldMaxLength: 30);

            migrationBuilder.AddColumn<int>(
                name: "CodigoCausal",
                table: "EP_Causal",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CodigoCausal",
                table: "EP_Causal");

            migrationBuilder.AlterColumn<string>(
                name: "Nombre",
                table: "EP_Causal",
                type: "nvarchar(30)",
                maxLength: 30,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(80)",
                oldMaxLength: 80);
        }
    }
}
