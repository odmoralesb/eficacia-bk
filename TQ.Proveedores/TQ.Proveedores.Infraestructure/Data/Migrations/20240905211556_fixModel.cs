using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TQ.Proveedores.Infraestructure.Data.Migrations
{
    public partial class fixModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Periodo",
                table: "EP_PlanAccion");

            migrationBuilder.AlterColumn<Guid>(
                name: "ProveedorId",
                table: "EP_PlanAccion",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Anio",
                table: "EP_PlanAccion",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Comentario",
                table: "EP_PlanAccion",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "CompradorId",
                table: "EP_PlanAccion",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<int>(
                name: "Trimestre",
                table: "EP_PlanAccion",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_EP_PlanAccion_CompradorId",
                table: "EP_PlanAccion",
                column: "CompradorId");

            migrationBuilder.AddForeignKey(
                name: "FK_EP_PlanAccion_EP_Usuario_CompradorId",
                table: "EP_PlanAccion",
                column: "CompradorId",
                principalTable: "EP_Usuario",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EP_PlanAccion_EP_Usuario_CompradorId",
                table: "EP_PlanAccion");

            migrationBuilder.DropIndex(
                name: "IX_EP_PlanAccion_CompradorId",
                table: "EP_PlanAccion");

            migrationBuilder.DropColumn(
                name: "Anio",
                table: "EP_PlanAccion");

            migrationBuilder.DropColumn(
                name: "Comentario",
                table: "EP_PlanAccion");

            migrationBuilder.DropColumn(
                name: "CompradorId",
                table: "EP_PlanAccion");

            migrationBuilder.DropColumn(
                name: "Trimestre",
                table: "EP_PlanAccion");

            migrationBuilder.AlterColumn<Guid>(
                name: "ProveedorId",
                table: "EP_PlanAccion",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier");

            migrationBuilder.AddColumn<string>(
                name: "Periodo",
                table: "EP_PlanAccion",
                type: "nvarchar(15)",
                maxLength: 15,
                nullable: false,
                defaultValue: "");
        }
    }
}
