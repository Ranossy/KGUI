---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/永王行宫_花月别院/花月别院_2号_时间加攻击母buff.lua
-- 更新时间:	2015/5/22 15:37:01
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	if scene.dwMapID == 230 or scene.dwMapID == 233 then---25人和帮会花月
		if npc.GetBuff(8919, 2) then
			if npc.GetBuff(8919, 2).nLeftActiveCount == 50 then
				npc.AddBuff(0, 99, 8920, 2)
			end
	
			if npc.GetBuff(8919, 2).nLeftActiveCount == 40 then
				npc.AddBuff(0, 99, 8920, 2)
			end
	
			if npc.GetBuff(8919, 2).nLeftActiveCount == 30 then
				npc.AddBuff(0, 99, 8920, 2)
			end
	
			if npc.GetBuff(8919, 2).nLeftActiveCount == 20 then
				npc.AddBuff(0, 99, 8920, 2)
			end
	
			if npc.GetBuff(8919, 2).nLeftActiveCount == 10 then
				npc.AddBuff(0, 99, 8920, 2)
			end
	
			if npc.GetBuff(8919, 2).nLeftActiveCount == 1 then
				npc.AddBuff(0, 99, 8920, 2)
			end
		end
	end

	if scene.dwMapID == 235 then---10人挑战
		if npc.GetBuff(8919, 3) then
			if npc.GetBuff(8919, 3).nLeftActiveCount == 50 then
				npc.AddBuff(0, 99, 8920, 3)
			end
	
			if npc.GetBuff(8919, 3).nLeftActiveCount == 40 then
				npc.AddBuff(0, 99, 8920, 3)
			end
	
			if npc.GetBuff(8919, 3).nLeftActiveCount == 30 then
				npc.AddBuff(0, 99, 8920, 3)
			end
	
			if npc.GetBuff(8919, 3).nLeftActiveCount == 20 then
				npc.AddBuff(0, 99, 8920, 3)
			end
	
			if npc.GetBuff(8919, 3).nLeftActiveCount == 10 then
				npc.AddBuff(0, 99, 8920, 3)
			end
	
			if npc.GetBuff(8919, 3).nLeftActiveCount == 1 then
				npc.AddBuff(0, 99, 8920, 3)
			end
		end
	end

	if scene.dwMapID == 237 then---10人挑战
		if npc.GetBuff(8919, 4) then
			if npc.GetBuff(8919, 4).nLeftActiveCount == 50 then
				npc.AddBuff(0, 99, 8920, 4)
			end
	
			if npc.GetBuff(8919, 4).nLeftActiveCount == 40 then
				npc.AddBuff(0, 99, 8920, 4)
			end
	
			if npc.GetBuff(8919, 4).nLeftActiveCount == 30 then
				npc.AddBuff(0, 99, 8920, 4)
			end
	
			if npc.GetBuff(8919, 4).nLeftActiveCount == 20 then
				npc.AddBuff(0, 99, 8920, 4)
			end
	
			if npc.GetBuff(8919, 4).nLeftActiveCount == 10 then
				npc.AddBuff(0, 99, 8920, 4)
			end
	
			if npc.GetBuff(8919, 4).nLeftActiveCount == 1 then
				npc.AddBuff(0, 99, 8920, 4)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com