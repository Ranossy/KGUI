---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_双曜亭/黑齿元佑_回魂.lua
-- 更新时间:	2016/4/8 17:27:06
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	if npc.GetBuff(10604, 2) then
		if npc.GetBuff(10604, 2).nStackNum == 1 then
			npc.nCurrentLife = npc.nCurrentLife + 1600
		end

		if npc.GetBuff(10604, 2).nStackNum == 2 then
			npc.nCurrentLife = npc.nCurrentLife + 4800
		end

		if npc.GetBuff(10604, 2).nStackNum == 3 then
			npc.nCurrentLife = npc.nCurrentLife + 12800
		end

		if npc.GetBuff(10604, 2).nStackNum == 4 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end

		if npc.GetBuff(10604, 2).nStackNum == 5 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end

		if npc.GetBuff(10604, 2).nStackNum == 6 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end
		
		if npc.GetBuff(10604, 2).nStackNum == 7 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end
		
		if npc.GetBuff(10604, 2).nStackNum == 8 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end
		
		if npc.GetBuff(10604, 2).nStackNum == 9 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end
		
		if npc.GetBuff(10604, 2).nStackNum == 10 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com