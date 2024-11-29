pragma solidity ^0.8.0;

contract StrayAnimals {
    uint256 public petCount = 0;

    struct Pet {
        uint256 id;
        string name;
        string breed;
        uint256 age;
        string gender;
        string health;
        string image;
        address adopter;
        bool isAdopted;
    }

    mapping(uint256 => Pet) public pets;

    event PetAdded(
        uint256 id,
        string name,
        string breed,
        uint256 age,
        string gender,
        string health,
        string image,
        address adopter,
        bool isAdopted
    );

    event PetAdopted(
        uint256 id,
        address adopter,
        bool isAdopted
    );

    constructor() {
        addPet("Thungtong", "Chinchilla", 4, "Male", "Vaccinated", "https://lh3.googleusercontent.com/fife/ALs6j_GazoC16bsXwds3ZAhsYVdxto6IbSc5KLmXZPCFU3vCAOk2NE4AzS-PFoqmoNzh5C_XJXyeVFWW-Nslh2Hg3C6nA6RpEWFoovdUrfwEykYILrZvAaRgmtYdDXByGorxRKRUPLQ2xjK5zeUZe95AVDIaAziIMCTeIPY4RnwQN313CYdjQ0y7qTqRQM_35REA3bl9i2cimn32zwmuezeG6LbhnkW_sA9K87bym579D4v7N2CtvQVOZKmahAw4JgEQFykQjJrV7LMh-INkUErdQBv4m3Pbe8MhzArKtcVIQJaOlKcB7D1tlwhQYgKHIIV8aW0wV2c79pXLb2GniUd7QXBmSRq_iVE7yAD_cYm8-rcd62z7MihjddsZZwhuTO5VnV8_2dZolh3qWx_dM1bMCHhOITRnS4KYsBDilSPWOqzIXGczxcwC2Ichk8ZSTrwflrEPKd2d5DARhA_U4pG65_2vNmmT3sqt8zWSyXIEIk4CzIUCAu0eRaTb5pPwAtLdiBSOAcPhzrp-EL0LjyjQk45TQKMqSX0sgYchONXCa_jpqB33xGVWL_Ob0lqr5elaS9pB1-2EINlixq-K-6bzVlHkqyUpLYTLJOm7y1GXlOWQs8eNud42u9uoZrvZCHLN3jbCcyuTbPtgr8J5VDxy5Af1QzSRvuZ9hyr3McqpGqYqbTfUmxGPKm44xrT0U43x6kzsrCpj6z8SvPbVrALQCuxfe8HqnbSeGtH8RUM8Wjhtjro0KV7EDGG5Ab-cKFJGABoge1SB7lQEtFPggZbFNbKb7QE4_lRilJpuORwmvUTFxj4Dfu9DlkjVJaZYHLsSDdSQTZ4e7k8cxOs63P8eMHhoIONEo3BGQ5BxCVNXh4J34zHYN62VCbSCa-EbgYFSrqPgRXsFAp_LR-O59vwNKCM_orpgqp5L38cpx5J8dUNTUek8dDbhrQLw9pGFUCOGwYeXdlLiMvaFzkk9yGdWOeqey2Xx9y69Y45BbPhk-Wl6z1daPWGBnhQWbxkW7QfCvFQoMBbStvhIFHPbgzntA1TH9y2GYOVRjzFgMAGK-67a56uG-augS9ROV3ZN2BRGOn9gkwpwxHI067CTHBvAC44Ms6tCcoeRPteQzTLymzVMKD0ju9quTgi12BxseSMN2OSAm4a1DVX1X3BqFQ6NN-MSpPkbvZm1v-FvtKtH4NyO8Vvfi6Mar3dnpRN4QDsZzBKDhtEL8FCkpbGZJg-1cP1vE2Q41faunmj1wSZUdCHkGL7qkNibCEEtY_BAegVvHrbzQd2mZUxbIkY3PMJvQxVMSf7fDjTWffy92I57jhgo7w1tCndfFoSAJGQLe-E0Zhv6WxqcoGYqfKRJgr09HMXnHFBTJjDc3lJWaGD2altTKp8C6HzwoOOd-0QgDRzwB_4l0KAJK_Ngj1734B2PODbeLz3OT4Za2ecDupmxRtOZ6YCx8VgIgoCir-1Y0xbW87Y56d6MS0wOvGOrpE8WywGypUP-Fq_pKPjnfevt_sXgiaZLBuuuVuHG_46g_pPA8TKyDQd38fnwPiAri_KOZMC4MKCmNGIDDEjqOk2ET5YKlmpJ16aKccnQfwy6aZ5UgeL7son_rglOIWY29R8=w1162-h867");
        addPet("Som", "Shiba", 5, "Female", "Vaccinated", "https://lh3.googleusercontent.com/fife/ALs6j_GWG-OPb-j_5J3E0biEiHCVhJiN-MOrBR5nhRW4XOQ1nz1RQP2cP4El550yHiu84Z2B2nNuTHfoPbe-xobvoPAPpDZUGX2rlcommO157GoPt52iypOQlVnD7XNaarD0Yh8rf1g6eJkEPwsp1b05WRyKSTNoshH2hSHGe6Rkf9jQ963M8tlRnuc9r3jqrm2q0sQ7J72b_c_eEDriZtDXB2rtgQaLdjzAXjLYFnFEGAdfvF32upNn3DHVJDsrZy2PLZJwXT5KVS9ISQcprwk3DqJ3mwGlKa_YkincJEACyaJ6U_RKYM5K3QTrLjQGQZ-uMVPHxuhWtvtZeo4hcZ1qe2bJCrO1VIeB1pWatrMXMT90e7VbByhsAIlqazmgZwlzkYoTNzKOuHnc89uf_tDHMzq1lhkXWLGXk2euRVjJknlNnNZvHFH05Ja6iOEWsQFAv3uYpXS92SBrBbZtiocO7L6EqH50fYeNV4J2HDOlK34M_E7qNezAjvU9w7gUG7KYAwUwuwg_3wDlrhcijJwC8g1paUTfH1wHiXnNpmXHD5j2A9NnwmlS0yFvVMdHVRXTHGxY_H_mOR0oLcFSuIaT9hEhjrYI0cRrRYdBApIA9DaW_mNZnskFt1n0z8PzemHOtwno9sOrRjJ8p_FQ1tStfomB_gu9wUT1KQKnaCMlGEi4xeiflupduwCOE39MW5AiJJrK6rD0-dCiI9bxDaDKVBlM6to3bgZENG-6W6f5yFb-j6D6nZQKwPNyyk3mthblsyHCvkI0GaL56mFM54ch7hJeLHgujkJAmDHV2TcXaafJ31JKjerZwQ6p4MoyVYge50kLlOqi6SwdRMS-BkVFDHDWhR5yH7xpRGLBPapcOIGhu-S6vDUbwL4Nt-ZE8hwIZmaxBm3vH0IYXUsfxMwxqKFdbwq9gGl4oz_nufHB_UdfOfOyUznjObluM8yM_QoY73kJYzr2Pab9VEnEsb7WQ6Lldhw8Cu4YMrnxweelzzB9hm-GRbPkcg92HTsD3GR0i3Qehmby5Rx6Uw-gKEXv99Ue7vpUxX2fTkAKaEye6fwItgYzkWQH0RgpgLyjE9xdmsSvUp1KpUlGrWRKKvHyY00MAU8JuV1GEi3Lc4fd80pE_q0AmiO6J5uxbRiIxd8_ZAq-O0iJ_9BTMfTh5IdnWZxHgP208Bywk6t0TxvKX-Mjm-1qaByb9EINVN1ybqD80XFI011XSnso8Urr-EtpFNFObFaEkpXmHl4a4xHb0s9AFM7VqOVtMWVUGaFMBoifuy8OTzTN74xSrTKThXxprdCGVcbxrNh7EotN3tkhx6nOtlBJGGl0-8Y_gWHd1tfjRxDKn3DKrCWH-HDhz2-7X-XMNTo1QjJESFwOrUnSK6uKFIdl2iO2D4mqZ3txEtH1VocYJXb7CKfE2yZnyfvDOT16eu-REu1xwomclpmMcKZnPpXXhtbDk9Z-ETxKREgStYYEzZPpYEbz9Kc59FCr0zNq-6xF9u0OlyscuSEyvS_s1zGilZTkkCTrgtTOSjDGOnwljjeL7U2iuWLLPbzpWVMR3-T12tRCxkRE6E6mYeGKpeepKK3iXRTQS8hRzyqtwDUC7_5fgClX7jl2C6f84Q=w1162-h867");
        addPet("Rocky", "Moggy", 2, "Male", "Vaccinated", "https://lh3.googleusercontent.com/fife/ALs6j_FZ_RLivha4v32QB4cPSN_mhrmPI8rqH_0zWvAtV177X8M4TpetqAFON_VeNjak1nM7OekBcLlyBkD8s7OJdLcMjjrklIoxxf0wXEuX3vq4FvgqCvUnXkiSnEd0pYFcNU609f1kBv9b6wzd2a9uzeRK4TQvyQCKVsgSpWRlzaaaeaKBRLFS8mPGOdAqyg1RcM4a-lTKwzpXykQ_LQcUHr9IdWebv233SYav-QEwEreYDyY91MhC6rfCeI9gwN8c5nnrWA_439G011h5sPc9gyq61HY62tBONVPlAJCcf2R2EqltQBw1mI7nZVXflffrmZguFVSB2vgNMJSQQvg0Cg0O0TCW-_pHeDoCJwWSLNNf_g-Rv9uFKZsriehu5h3jMcedzGXtbBvMWNn-vxoYR6ooUQNvoAgUW_pKDqVEu607l2kPIc-fRRBJHhlvU5Q1QpFbggjDNlYlgaXDbo7RYW58jwCi4_omnWUtA_I3ULjxD3jJXcANwjTXakh7U4G88U4I4cFUKSwokU9F-t169HU5y8FnLD_icbYT9zP9epGXaNCPzN1RwsCyV4m2cJp0i8l_4Cd25czQFAi6JEPnv-Xz7Vvfe21vPWBusb9seyMcNnwKwjeTNzJJavnubYqhQXYg7wlQr25uQmYfIimZXER360BWXX4TXIQLPuE9htI6wSXnrzZs74FZzFgL7TAFYWNm91DG9lyn_EAiIZD6o_LA_s_o90YVGlOXFPRs7vJCz1d01vtu0NgW5dE02g21sTznnNfDxME_FZVS0d3sen4y__RYH6K7fyf-Tvtz6MmpD9eqFgL_kpfeXVXMQuw0zA8V67GSCkJdiYzeyW9TtIgEXpZCshHLBMtmGNATqqSM7phlP1vf_BHsmcB1yij-3Xch3kv_30B9tUi5esASiCQRP2rx78q2ic1tVzqk8JcmOrW3ZW-wqlqqluTiJWBaKkGlvkLu9gYKuVbvn-P_b8vr4lN75iU9MLsbVZIjmcDE5ZcA5hyz23NE6Dq5YB8-VCjFiWLVZQi5JgruH2f5L8csPKVopW-8-URLXV76Nx--qra1RTvc-G41fxuKIke4vOmvYoXZFu1GwRBZNJ_1nu65axympkwXgspHzqIYnvTC6OnwSoNbU6m0qvOMfGUUeNVY_nt76XnU5_dPkjY-1bI7MIbpmF6HtIu9zt6SDyOxYH7dLX6gZuYj5Wzu0NrDvBqcPN_neanNDX3bKnwq_jx7EorhEqMm22zxtss_DA0L0wthNaFRIu6PUEX-JM5fEk6MwHBdJZFecG48tkmhD1jP4QPWJTfHM8m5E4nREHCR4BJQp8aVIiH5n-w_dGihGO7BJ1lyl-gcUiW8FNdQv0CyiTSf9jHSSEYfpoGxK2EkfW2Zl2btIt5JEEKfDbSylV6fYkvbAQQXJXdaBpomqGBk8E-ReYDVHOux4GjchtaR71YzWmhd7ZjzcNJ0dqBIU8R-kAUqlH3VWyO2rY5ZRRT6bqWQ6NFLUGPnNYMzLR6zXEN2im13EkojUoFGX2cnhF8r0WGLYF1mMXBQ5UdCngjSbwr1lbiEcluBQ3FlCfimrftb9hgDqU38A8Tt_XubyZw3xqJd_xnaXnynbWqG2Q=w1162-h867");
        addPet("Moji", "Corgi", 5, "Male", "Vaccinated", "https://bit.ly/3B2nfFk");
        addPet("Tanjira Lucy Tha-rae", "Bantam", 2, "Female","Vaccinated", "https://bit.ly/3Oxd272");
    }

    function addPet(
        string memory _name,
        string memory _breed,
        uint256 _age,
        string memory _gender,
        string memory _health,
        string memory _image
    ) public {
        petCount ++;
        pets[petCount] = Pet(petCount, _name, _breed, _age, _gender, _health, _image, msg.sender, false);
        require(bytes(_name).length > 0, "Pet name is required.");
        require(bytes(_breed).length > 0, "Pet breed is required.");
        emit PetAdded(petCount, _name, _breed, _age, _gender, _health, _image, msg.sender, false);
    }

    function adoptPet(uint256 _petId) public {
        Pet storage pet = pets[_petId];
        require(msg.sender != pet.adopter, "You can't adopt your own pet.");
        require(pet.isAdopted == false, "Pet already adopted.");
        pet.adopter = msg.sender;
        pet.isAdopted = true;
        emit PetAdopted(_petId, pet.adopter, pet.isAdopted);
    }

    function getpetCount() public view returns (uint256 _petCount) {
        return petCount;
    }

    function getPetInfo(uint256 _petId) public view returns (string memory _name, string memory _breed, uint256 _age, string memory _gender, string memory _health, string memory _image, address _adopter, bool _isAdopted) {
        Pet storage pet = pets[_petId];
        return (pet.name, pet.breed, pet.age, pet.gender, pet.health, pet.image, pet.adopter, pet.isAdopted);
    }
}
