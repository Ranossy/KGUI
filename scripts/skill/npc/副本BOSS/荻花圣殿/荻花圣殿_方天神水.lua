--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
		if not cPlayer then
			return
		end
		if cPlayer.nCurrentLife > cPlayer.nMaxLife * 0.8 then
			cPlayer.nCurrentLife = cPlayer.nMaxLife 
		else
			cPlayer.nCurrentLife = cPlayer.nCurrentLife + cPlayer.nMaxLife * 0.2
    end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com