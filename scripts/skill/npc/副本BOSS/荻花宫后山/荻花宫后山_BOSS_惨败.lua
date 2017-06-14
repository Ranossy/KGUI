---------------------------------------------------------------------->
-- 脚本名称:	scripts/Map/荻花宫后山/skill/人妖之啵.lua
-- 更新时间:	12/13/10 16:55:01
-- 更新用户:	yule-PC
-- 脚本说明:	
----------------------------------------------------------------------<

-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local cPlayer = GetPlayer(dwCharacterID)
		if cPlayer then
			cPlayer.AddBuff(0,99,2319,1)
		end
	end
end

-- 技能反应用脚本, 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com