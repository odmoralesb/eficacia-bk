using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TQ.Proveedores.Infraestructure.Migrations
{
    public partial class FixPlanAccion : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "CompradorId",
                table: "EP_PlanAccion",
                type: "uniqueidentifier",
                nullable: true);

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
                name: "CompradorId",
                table: "EP_PlanAccion");

            migrationBuilder.DropColumn(
                name: "Trimestre",
                table: "EP_PlanAccion");
        }
    }
}
