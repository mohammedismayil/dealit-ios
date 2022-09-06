// Copyright © 2017-2022 Trust Wallet.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

import Foundation

public struct Cardano {

    public static func minAdaAmount(tokenBundle: Data) -> UInt64 {
        let tokenBundleData = TWDataCreateWithNSData(tokenBundle)
        defer {
            TWDataDelete(tokenBundleData)
        }
        return TWCardanoMinAdaAmount(tokenBundleData)
    }


    init() {
    }


}
