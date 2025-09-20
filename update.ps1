Write-Host "🔄 جاري تحديث المستودع..." -ForegroundColor Cyan

# إضافة جميع الملفات المتغيرة
git add .

# إنشاء commit جديد
git commit -m "تحديث تلقائي: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"

# رفع التغييرات
git push origin main

Write-Host "✅ تم التحديث بنجاح!" -ForegroundColor Green