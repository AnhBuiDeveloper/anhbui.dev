#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Start the Astro dev server, killing any existing instance first.
.DESCRIPTION
    Frees the dev port (default 4321) by stopping whatever process is
    listening on it, then starts `npm run dev`.
.PARAMETER Port
    The port the dev server listens on. Defaults to 4321 (Astro default).
.EXAMPLE
    ./start-server.ps1
    ./start-server.ps1 -Port 3000
#>
param(
    [int]$Port = 4321
)

$ErrorActionPreference = 'Stop'

# Run from the script's own directory regardless of where it's invoked from.
Set-Location -Path $PSScriptRoot

function Stop-PortListener {
    param([int]$Port)

    $listeners = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
    if (-not $listeners) {
        Write-Host "No process is listening on port $Port." -ForegroundColor DarkGray
        return
    }

    $pids = $listeners.OwningProcess | Sort-Object -Unique
    foreach ($processId in $pids) {
        try {
            $proc = Get-Process -Id $processId -ErrorAction Stop
            Write-Host "Killing process '$($proc.ProcessName)' (PID $processId) on port $Port..." -ForegroundColor Yellow
            Stop-Process -Id $processId -Force -ErrorAction Stop
        } catch {
            Write-Host "Could not stop PID ${processId}: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

Write-Host "Checking for existing server on port $Port..." -ForegroundColor Cyan
Stop-PortListener -Port $Port

Write-Host "Starting dev server on port $Port..." -ForegroundColor Green
npm run dev -- --port $Port
