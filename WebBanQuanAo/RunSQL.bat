@echo off
chcp 65001 >nul
echo ========================================
echo   TẠO DATABASE QUANAODB
echo ========================================
echo.
echo Đang chạy script SQL...
echo.

sqlcmd -S localhost -E -i "CreateDatabaseComplete.sql"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✅ THÀNH CÔNG!
    echo ========================================
    echo.
    echo Database: QuanAoDB
    echo Sản phẩm: 12 sản phẩm
    echo Danh mục: 6 danh mục
    echo Thương hiệu: 6 thương hiệu
    echo.
    echo Tài khoản admin:
    echo   Username: admin
    echo   Password: admin123
    echo.
) else (
    echo.
    echo ========================================
    echo   ❌ LỖI!
    echo ========================================
    echo.
    echo Vui lòng kiểm tra:
    echo 1. SQL Server đã chạy chưa?
    echo 2. Tên server có đúng không?
    echo.
)

echo.
pause

