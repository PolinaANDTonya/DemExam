
//  для связи между этим проектом и конкретной БД
=======

//
//  Supabase.swift
//  DemExam_Ushakova
//

//  Created by Ушакова Антонина Андреевна on 12.10.2024.
//

import Supabase
import Foundation

let supabase = SupabaseClient (
    supabaseURL: URL(string: "https://ugkjtcanhjjjwbbhwgbi.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVna2p0Y2FuaGpqandiYmh3Z2JpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0Mzg3NTUsImV4cCI6MjA0NDAxNDc1NX0.it7XMiUoWYyeEy5V-JNiLDSv2U3UD-kN_DDvQEuSYkc",
    options: .init()
)


//  Created by User on 12.10.2024.
//

import Foundation
