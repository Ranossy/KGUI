------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2012-9-19
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local nBuff1 = cPlayer.GetBuff(4460, 1)
	if nBuff1 then
		if nBuff1.nStackNum == 3 then
			cPlayer.DelBuff(4460,1)
			cPlayer.DelBuff(4460,1)
			cPlayer.DelBuff(4460, 1)
			cPlayer.Stop()
			cPlayer.AddBuff(0,99,4469,1)
		end
	end
	local nBuff2 = cPlayer.GetBuff(4460, 2)
	if nBuff2 then
		if nBuff2.nStackNum == 3 then
			cPlayer.DelBuff(4460,2)
			cPlayer.DelBuff(4460,2)
			cPlayer.DelBuff(4460, 2)
			cPlayer.Stop()
			cPlayer.AddBuff(0,99,4469,2)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com