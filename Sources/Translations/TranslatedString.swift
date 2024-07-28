//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 23-12-2023.
//

import Foundation
import Languages
import ToolKit

public extension String {

    static let developers: TranslatedString = .init(
        dutch: "developers",
        english: "developers"
    )

    static let contact: TranslatedString = .init(
        dutch: "contact",
        english: "contact"
    )

    static let contact_me: TranslatedString = .init(
        dutch: "neem contact op",
        english: "get in touch"
    )

    static let hire_me: TranslatedString = .init(
        dutch: "neem mij aan",
        english: "hire me"
    )

    static let contact_sales: TranslatedString = .init(
        dutch: "neem contact op",
        english: "contact sales"
    )

    static let sales: TranslatedString = .init(
        dutch: "sales",
        english: "sales"
    )

    static let start_now: TranslatedString = .init(
        dutch: "start nu",
        english: "start now"
    )

    static let dashboard: TranslatedString = .init(
        dutch: "dashboard",
        english: "dashboard"
    )

    static let products: TranslatedString = .init(
        dutch: "producten",
        english: "products"
    )

    static let pricing: TranslatedString = .init(
        dutch: "tarieven",
        english: "pricing"
    )

    static let resources: TranslatedString = .init(
        dutch: "informatie",
        english: "resources"
    )

    static let solutions: TranslatedString = .init(
        dutch: "oplossingen",
        english: "solutions"
    )

    static let api: String = "api"

    static let account: TranslatedString = .init(
        dutch: "account",
        english: "account"
    )

    static let person: TranslatedString = .init(
        dutch: "persoon",
        english: "person"
    )

    static let email: TranslatedString = .init(
        dutch: "email",
        english: "email"
    )

    static let current_email: TranslatedString = .init(
        dutch: "huidige email",
        english: "current email"
    )

    static let unknown: TranslatedString = .init(
        dutch: "onbekend",
        english: "unknown"
    )

    static let your_current_email_address_is: TranslatedString = .init(
        dutch: "uw huidige emailadres is",
        english: "your current email address is"
    )

    static let security: TranslatedString = .init(
        dutch: "beveiliging",
        english: "security"
    )

    static let index: TranslatedString = .init(
        english: "index"
    )

    static let privacyPolicy: TranslatedString = .init(
        dutch: "privacybeleid",
        english: "privacy policy"
    )

    static let navigationbar: TranslatedString = .init(
        dutch: "navigatiebar",
        english: "navigationbar"
    )

    static let dark_mode: TranslatedString = .init(
        dutch: "donkere modus",
        english: "dark mode"
    )

    static let light_mode: TranslatedString = .init(
        dutch: "lichte modus",
        english: "light mode"
    )

    static let about_me: TranslatedString = .init(
        dutch: "over mij",
        english: "about"
    )

    static let about_us: TranslatedString = .init(
        dutch: "over ons",
        english: "about"
    )

    static let about: TranslatedString = String.about_us

    static let choose_country_region: TranslatedString = .init(
        dutch: "kies regio",
        english: "choose country region"
    )

    static let choose_language: TranslatedString = .init(
        dutch: "kies taal",
        english: "choose language"
    )

    static let change_your_password: TranslatedString = .init(
        dutch: "verander uw wachtwoord",
        english: "change your password"
    )

    static let when_you_change_your_password_we_keep_you_logged_in_to_this_device_but_may_log_you_out_from_your_other_devices: TranslatedString = .init(
        dutch: "wanneer u uw wachtwoord wijzigt, zorgen wij ervoor dat u ingelogd blijft op dit apparaat, maar mogelijk wordt u ook afgemeld vanaf uw andere apparaten",
        english: "when you change your password, we keep you logged in to this device but may log you out from your other devices"
    )

    static let current_password: TranslatedString = .init(
        dutch: "huidige wachtwoord",
        english: "current password"
    )

    static let new_password: TranslatedString = .init(
        dutch: "nieuw wachtwoord",
        english: "new password"
    )

    static let request_reset_password: TranslatedString = .init(
        dutch: "verzoek reset wachtwoord",
        english: "request reset password"
    )

    static let checkout: TranslatedString = .init(
        dutch: "afrekenen",
        english: "checkout"
    )

    static let blog: TranslatedString = .init(
        //        dutch: "blog",
        english: "blog"
    )

    static let copyright: TranslatedString = .init(
        dutch: "auteursrecht",
        english: "copyright"
    )

    static let all_rights_reserved: TranslatedString = .init(
        dutch: "Alle rechten voorbehouden",
        english: "all rights reserved"
    )

    static let login: TranslatedString = .init(
        dutch: "log in",
        english: "log in"
    )

    static let welcome_back: TranslatedString = .init(
        dutch: "welkom terug",
        english: "welcome back"
    )

    static let reset_your_password: TranslatedString = .init(
        dutch: "reset uw wachtwoord",
        english: "reset your password"
    )

    static let check_your_mail: TranslatedString = .init(
        dutch: "check uw mail",
        english: "check your mail"
    )

//    static func this_link_is_valid_for(_ duration: Date.Time) -> TranslatedString {
//        .init(
//            dutch: "deze link is geldig voor \(duration.description().description)",
//            english: "this link is valid for \(duration.description().description)"
//        )
//    }

    static let we_have_emailed_you_instructions_to_reset_your_password: TranslatedString = .init(
        dutch: "we hebben u per e-mail instructies gestuurd om uw wachtwoord opnieuw in te stellen",
        english: "we have emailed you instructions to reset your password"
    )

    static let please_check_your_inbox_and_click_the_link_in_the_email_to_reset_your_password: TranslatedString = .init(
        dutch: "controleer uw inbox en klik op de link in de e-mail om uw wachtwoord opnieuw in te stellen",
        english: "please check your inbox and click the link in the email to reset your password"
    )

    static let if_you_dont_receive_an_email_from_us_within_a_few_minutes_please_check_your_spam_folder: TranslatedString = .init(
        dutch: "als u binnen enkele minuten geen e-mail van ons ontvangt, controleer dan uw spammap",
        english: "if you don't receive an email from us within a few minutes, please check your spam folder"
    )

    static let if_you_continue_to_experience_issues_please_contact_our_support_team: TranslatedString = .init(
        dutch: "als u problemen blijft ondervinden, neem dan contact op met ons ondersteuningsteam",
        english: "if you continue to experience issues, please contact our support team"
    )

    static let enter_your_email_address_and_we_will_send_you_instructions_to_reset_your_password: TranslatedString = .init(
        dutch: "vul uw e-mailadres in en wij sturen u instructies om uw wachtwoord opnieuw in te stellen",
        english: "enter your email address and we will send you instructions to reset your password"
    )

    static let to_reset_your_password_please_click_the_button_below_and_follow_the_instructions: TranslatedString = .init(
        dutch: "Om uw wachtwoord opnieuw in te stellen, klikt u op de onderstaande knop en volgt u de instructies",
        english: "to reset your password, please click the button below and follow the instructions"
    )

    static let create_your_account: TranslatedString = .init(
        dutch: "maak uw account aan",
        english: "create your account"
    )

    //    static let register:TranslatedString = .init(
    //        dutch: "registreer",
    //        english: "register"
    //    )

    static let signup: TranslatedString = .init(
        dutch: "registreer",
        english: "sign up"
    )

    static let registration: TranslatedString = .init(
        dutch: "registratie",
        english: "registration"
    )

    static let emailadres: TranslatedString = .init(
        dutch: "e-mailadres",
        english: "emailaddress"
    )

    static let name: TranslatedString = .init(
        dutch: "naam",
        english: "name"
    )

    static let password: TranslatedString = .init(
        dutch: "wachtwoord",
        english: "password"
    )

    static let forgot_password: TranslatedString = .init(
        dutch: "wachtwoord vergeten",
        english: "forgot password"
    )

    static let already_have_an_account: TranslatedString = .init(
        dutch: "heeft u al een account?",
        english: "already have an account?"
    )

    static let `continue`: TranslatedString = .init(
        dutch: "ga door",
        english: "continue"
    )

    static let logout: TranslatedString = .init(
        dutch: "uitloggen",
        english: "logout"
    )

    static let date_of_birth: TranslatedString = .init(
        dutch: "geboortedatum",
        english: "date of birth"
    )

    static let save: TranslatedString = .init(
        dutch: "bewaar",
        english: "save"
    )

    static let dont_have_an_account: TranslatedString = .init(
        dutch: "heeft u geen account",
        english: "don't have an account"
    )

    static let under_construction: TranslatedString = .init(
        //        dutch: "",
        english: "under construction"
    )

    static let terms_of_use: TranslatedString = .init(
        dutch: "gebruiksvoorwaarden",
        english: "terms of use"
    )
    
    static let general_terms_and_conditions: TranslatedString = .init(
        dutch: "algemene voorwaarden",
        english: "general terms and conditions"
    )

    static let sales_and_refunds: TranslatedString = .init(
        dutch: "verkopen en refunds",
        english: "sales and refunds"
    )

    static let learn_more: TranslatedString = .init(
        dutch: "Leer meer",
        english: "Learn more"
    )

    static let legal: TranslatedString = .init(
        dutch: "juridisch",
        english: "legal"
    )

    static let sitemap: TranslatedString = .init(
        dutch: "sitemap",
        english: "site map"
    )

    static let home: TranslatedString = .init(
        dutch: "home",
        english: "home"
    )

    static let delete: TranslatedString = .init(
        dutch: "verwijder",
        english: "delete"
    )

    static let company: TranslatedString = .init(
        dutch: "bedrijf",
        english: "company"
    )

    static let logo: TranslatedString = .init(
        dutch: "logo",
        english: "logo"
    )

    static let get_started_immediatly: TranslatedString = .init(
        dutch: "Probeer het nu",
        english: "Get started immediatly"
    )

    static let our_story: TranslatedString = .init(
        dutch: "ons verhaal",
        english: "our story"
    )
    static let management_team: TranslatedString = .init(
        dutch: "management",
        english: "management team"
    )
    static let press: TranslatedString = .init(
        dutch: "pers",
        english: "press"
    )
    static let career: TranslatedString = .init(
        dutch: "carrière",
        english: "career"
    )

    static let role: TranslatedString = .init(
        dutch: "rol",
        english: "role"
    )

    static let roles: TranslatedString = .init(
        dutch: "rollen",
        english: "roles"
    )

    static let services: TranslatedString = .init(
        dutch: "diensten",
        english: "services"
    )

    static let service: TranslatedString = .init(
        dutch: "dienst",
        english: "service"
    )
}

public extension String {
    static let lorem_impsum: Self = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Imperdiet dui accumsan sit amet nulla. Morbi non arcu risus quis varius quam quisque id diam. Massa sed elementum tempus egestas sed sed risus pretium. Ante in nibh mauris cursus mattis molestie a iaculis at. Sed arcu non odio euismod lacinia at quis risus sed. Purus in massa tempor nec feugiat nisl pretium fusce. Elementum tempus egestas sed sed. Sed euismod nisi porta lorem mollis aliquam. Dolor sit amet consectetur adipiscing elit duis tristique sollicitudin nibh. Auctor elit sed vulputate mi sit amet mauris. Morbi blandit cursus risus at ultrices mi tempus imperdiet. Cursus sit amet dictum sit amet justo donec. Pulvinar elementum integer enim neque volutpat ac tincidunt vitae. Ornare lectus sit amet est. Adipiscing tristique risus nec feugiat. Massa tempor nec feugiat nisl."
    static let lorem_impsum1: Self = "Massa sed elementum tempus egestas sed sed risus pretium. Dignissim convallis aenean et tortor. Non blandit massa enim nec dui nunc mattis enim ut. Nisi lacus sed viverra tellus in hac habitasse platea dictumst. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Eu nisl nunc mi ipsum. Nascetur ridiculus mus mauris vitae ultricies leo integer malesuada. Lectus vestibulum mattis ullamcorper velit sed ullamcorper. Sed id semper risus in hendrerit gravida rutrum quisque non. Tristique risus nec feugiat in fermentum posuere. Vitae tempus quam pellentesque nec nam aliquam sem et tortor."
    static let lorem_impsum2: Self = "Urna cursus eget nunc scelerisque viverra mauris in aliquam sem. Magna fermentum iaculis eu non. Sollicitudin tempor id eu nisl nunc mi ipsum faucibus vitae. Dui nunc mattis enim ut tellus. Donec adipiscing tristique risus nec feugiat in fermentum posuere. Vitae congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque. Ac tortor dignissim convallis aenean. Suspendisse interdum consectetur libero id faucibus nisl tincidunt. Amet tellus cras adipiscing enim eu turpis egestas pretium. Feugiat in ante metus dictum at tempor commodo ullamcorper."
    static let lorem_impsum3: Self = "Lacus vel facilisis volutpat est velit egestas dui id ornare. Congue quisque egestas diam in. Dignissim sodales ut eu sem integer vitae justo eget magna. Praesent elementum facilisis leo vel. Arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque. Lobortis elementum nibh tellus molestie. Suspendisse ultrices gravida dictum fusce ut. Facilisi cras fermentum odio eu. Vel facilisis volutpat est velit egestas dui id. Egestas erat imperdiet sed euismod nisi porta. Viverra vitae congue eu consequat ac felis. Laoreet sit amet cursus sit amet dictum sit amet. Massa eget egestas purus viverra. Enim neque volutpat ac tincidunt vitae. Convallis aenean et tortor at risus viverra adipiscing."
    static let lorem_impsum4: Self = "Est ante in nibh mauris. Pharetra et ultrices neque ornare aenean euismod. Varius morbi enim nunc faucibus a. Tincidunt lobortis feugiat vivamus at augue eget arcu dictum. Tortor dignissim convallis aenean et tortor. Interdum velit euismod in pellentesque massa placerat. Urna nunc id cursus metus aliquam eleifend. Id leo in vitae turpis. Interdum velit euismod in pellentesque massa placerat duis. Viverra accumsan in nisl nisi. Vivamus arcu felis bibendum ut tristique. Purus non enim praesent elementum facilisis leo vel fringilla. Rhoncus dolor purus non enim. Tellus molestie nunc non blandit massa."
    static let lorem_impsum5: Self = "Massa sed elementum tempus egestas sed sed risus pretium. Dignissim convallis aenean et tortor. Non blandit massa enim nec dui nunc mattis enim ut. Nisi lacus sed viverra tellus in hac habitasse platea dictumst. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Eu nisl nunc mi ipsum. Nascetur ridiculus mus mauris vitae ultricies leo integer malesuada. Lectus vestibulum mattis ullamcorper velit sed ullamcorper. Sed id semper risus in hendrerit gravida rutrum quisque non. Tristique risus nec feugiat in fermentum posuere. Vitae tempus quam pellentesque nec nam aliquam sem et tortor."
}
