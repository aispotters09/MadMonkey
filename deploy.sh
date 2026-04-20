#!/bin/bash

# Deployment script for Mad Monkey Restaurant
# Switches between local development and production paths

echo "Mad Monkey Restaurant Deployment Script"
echo "========================================"

# Check if we're deploying to production
if [ "$1" == "production" ]; then
    echo "Switching to production paths for Vercel deployment..."
    
    # Update paths to absolute for production
    sed -i.bak 's|href="styles.css"|href="/styles.css"|g' index.html
    sed -i.bak 's|src="script.js"|src="/script.js"|g' index.html
    
    echo "Production paths applied!"
    echo "Ready for Vercel deployment"
    echo ""
    echo "To revert to local development, run: ./deploy.sh local"
    
elif [ "$1" == "local" ]; then
    echo "Switching to local development paths..."
    
    # Update paths to relative for local development
    sed -i.bak 's|href="/styles.css"|href="styles.css"|g' index.html
    sed -i.bak 's|src="/script.js"|src="script.js"|g' index.html
    
    echo "Local development paths applied!"
    echo "Ready for local development"
    echo ""
    echo "To deploy to production, run: ./deploy.sh production"
    
else
    echo "Usage:"
    echo "  ./deploy.sh production  - Switch to production paths for Vercel"
    echo "  ./deploy.sh local       - Switch to local development paths"
    echo ""
    echo "Current status:"
    if grep -q "href=\"/styles.css\"" index.html; then
        echo "  Mode: Production (absolute paths)"
    else
        echo "  Mode: Local Development (relative paths)"
    fi
fi

echo ""
echo "Files updated:"
echo "  - index.html (CSS and JS paths)"
echo ""
echo "Note: Backup files (.bak) are created automatically"
