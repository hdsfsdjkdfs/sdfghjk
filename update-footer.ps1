# تعديل جميع ملفات HTML
Get-ChildItem -Path . -Filter "*.html" | ForEach-Object {
    $content = Get-Content $_.FullName -Raw

    # إضافة Font Awesome
    if ($content -notlike "*font-awesome*") {
        $content = $content -replace '<link href="templatemo-neural-style.css" rel="stylesheet">', '<link href="templatemo-neural-style.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">'
    }

    # إضافة أنماط الفوتر
    $footerStyles = @'
    <style>
        .footer-content {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 2rem;
            text-align: center;
            flex-direction: row-reverse;
        }
        .footer-section {
            flex: 1;
            min-width: 250px;
        }
        .footer-section h3 {
            color: #00f7ff;
            margin-bottom: 1.5rem;
            font-size: 1.2em;
            position: relative;
            display: inline-block;
        }
        .footer-section ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .footer-section ul li {
            margin-bottom: 15px;
        }
        .footer-section ul li a {
            color: #fff;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.3s ease;
            flex-direction: row-reverse;
        }
        .footer-section ul li a i {
            color: #00f7ff;
            font-size: 1em;
        }
        .footer-section ul li a:hover {
            color: #00f7ff;
            transform: scale(1.05) translateX(-5px);
        }
        .social-links {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            margin-top: 1rem;
        }
        .social-links a {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(0, 247, 255, 0.1);
            border-radius: 50%;
            color: #fff;
            font-size: 1.2em;
            transition: all 0.3s ease;
        }
        .social-links a:hover {
            background: #00f7ff;
            color: #000;
            transform: translateY(-3px);
        }
        .footer-bottom {
            text-align: center;
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
    </style>
'@

    # إضافة الأنماط إلى head
    if ($content -notlike "*footer-content*") {
        $content = $content -replace '</head>', "$footerStyles</head>"
    }

    # تحديث الفوتر
    $newFooter = @'
    <footer>
        <div class="footer-wrapper">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>روابط سريعة</h3>
                    <ul>
                        <li><a href="index.html"><i class="fas fa-home"></i>الرئيسية</a></li>
                        <li><a href="research.html"><i class="fas fa-search"></i>البحوث</a></li>
                        <li><a href="presentations.html"><i class="fas fa-desktop"></i>العروض</a></li>
                        <li><a href="library.html"><i class="fas fa-book"></i>المكتبة</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>استكشف المزيد</h3>
                    <ul>
                        <li><a href="about.html"><i class="fas fa-info-circle"></i>عن البحوث</a></li>
                        <li><a href="presentations.html"><i class="fas fa-chalkboard-teacher"></i>عن العروض</a></li>
                        <li><a href="matrix.html"><i class="fas fa-th"></i>المصفوفة</a></li>
                        <li><a href="features.html"><i class="fas fa-bolt"></i>التطور</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>الدعم والمساعدة</h3>
                    <ul>
                        <li><a href="#"><i class="fas fa-question-circle"></i>الأسئلة الشائعة</a></li>
                        <li><a href="#"><i class="fas fa-shield-alt"></i>سياسة الخصوصية</a></li>
                        <li><a href="#"><i class="fas fa-file-contract"></i>الشروط والأحكام</a></li>
                        <li><a href="#"><i class="fas fa-headset"></i>مركز المساعدة</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>تواصل معنا</h3>
                    <div class="social-links">
                        <a href="https://facebook.com" title="فيسبوك"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://tiktok.com" title="تيك توك"><i class="fab fa-tiktok"></i></a>
                        <a href="https://t.me" title="تليجرام"><i class="fab fa-telegram-plane"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p><i class="fas fa-rocket"></i> بحثك جاهز – جميع الحقوق محفوظة 2025</p>
            </div>
        </div>
    </footer>
'@

    # استبدال الفوتر القديم بالجديد
    $content = $content -replace '(?s)<footer>.*?</footer>', $newFooter

    # حفظ التغييرات
    $content | Set-Content $_.FullName -Force
}