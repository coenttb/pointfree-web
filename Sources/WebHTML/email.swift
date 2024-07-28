//
//  File 2.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 17/05/2024.
//

import Foundation

public extension String {

    static let emailCSS: String = """
        .ReadMsgBody {
            width: 100%;
            background-color: #ffffff;
        }

        .ExternalClass {
            width: 100%;
            background-color: #ffffff;
        }

        body {
            width: 100%;
            background-color: #E5E5E5;
            margin: 0;
            padding: 0;
            -webkit-font-smoothing: antialiased;
            font-family: Helvetica Light, Helvetica, Arial, sans-serif;
            -webkit-text-size-adjust: none !important;
        }

        table {
            border-collapse: separate;
        }
        /* MOBILE STYLES */

        @media screen and (max-width: 525px) {
            /* ALLOWS FOR FLUID TABLES */
            .wrapper {
                width: 100% !important;
                max-width: 100% !important;
            }
            /* ADJUSTS LAYOUT OF LOGO IMAGE */
            .logo img {
                margin: 0 auto !important;
            }
            /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */
            .mobile-hide {
                display: none !important;
            }
            .img-max {
                max-width: 100% !important;
                width: 100% !important;
                height: auto !important;
            }
            /* FULL-WIDTH TABLES */
            .responsive-table {
                width: 100% !important;
            }
            /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */
            .padding {
                padding: 0px 5% 0px 5% !important;
            }
            .padding-meta {
                padding: 30px 5% 0px 5% !important;
                text-align: center;
            }
            .no-padding {
                padding: 0 !important;
            }
            .section-padding {
                padding: 0px 15px 0px 15px !important;
            }
            /* ADJUST BUTTONS ON MOBILE */
            .mobile-button-container {
                margin: 0 auto;
                width: 100% !important;
            }
            .mobile-button {
                padding: 15px !important;
                border: 0 !important;
                font-size: 16px !important;
                display: block !important;
            }
        }

        table, td, b, a, strong, p, div {
            font-family: 'Helvetica Neue', Arial, 'sans-serif';
        }

        td.content {
            font: 16px/22px 'Helvetica Neue', Arial, 'sans-serif';
            text-align: left;
            padding: 50px 40px 0px 40px;
            color: #555555;
        }

        a {
            color: #1DBF73;
            text-decoration:none;
        }
        /* ANDROID CENTER FIX */

        div[style*="margin: 16px 0;"] {
            margin: 0 !important;
        }

        a.fiverr-social-icon {
            display: inline-block;
            margin: 2px 5px;
        }
    """

}
