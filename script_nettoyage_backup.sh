#!/bin/bash

# Variables
DIFF_DIR="/home/r1ck/Simulated_S2/R2/sauvegardes_diff"
FULL_DIR="/home/r1ck/Simulated_S2/R2/sauvegardes_completes"
LOGFILE="/home/r1ck/logs/nettoyage.log"

# Suppression des sauvegardes différentielles âgées de plus de 7 jours
find "$DIFF_DIR" -type d -mtime +7 -exec rm -rf {} \; >> "$LOGFILE" 2>&1

# Suppression des sauvegardes hebdomadaires âgées de plus de 4 semaines
find "$FULL_DIR" -type d -name "backup_complet_*" -mtime +28 -exec rm -rf {} \; >> "$LOGFILE" 2>&1

# Suppression des sauvegardes mensuelles âgées de plus de 6 mois
find "$FULL_DIR" -type d -name "backup_complet_*" -mtime +180 -exec rm -rf {} \; >> "$LOGFILE" 2>&1

echo "Nettoyage terminé : $(date)" >> "$LOGFILE"
