function Load()
    local param = GetSkillGlobalParam()
	param.fPlayerCriticalCof			= 0.75
    param.fCriticalStrikeParam          = 5.347 
    param.fCriticalStrikePowerParam     = 1.944 
    param.fDefCriticalStrikeParam       = 5.347
    param.fDecriticalStrikePowerParam   = 0.945
    param.fHitValueParam                = 4.419
    param.fDodgeParam                   = 3.097
    param.fParryParam                   = 2.237
    param.fInsightParam                 = 3.314
    param.fPhysicsShieldParam           = 2.382
    param.fMagicShieldParam             = 2.382
	param.fOvercomeParam         		= 4.667
	param.fHasteRate                    = 6.087
	param.fToughnessDecirDamageCof		= 1.413

    Log("[Skill]Global Param Init Successful.")
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com