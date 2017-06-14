---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/沈眠风_破釜沉舟母buff.lua
-- 更新时间:	2016/4/8 14:27:09
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	if scene.dwMapID == 240 or scene.dwMapID == 250 then
		if npc.GetBuff(10598, 1) then
			if npc.GetBuff(10598, 1).nLeftActiveCount == 55 then
				npc.FireAIEvent(2001, 0, 0)
			end
	
			if npc.GetBuff(10598, 1).nLeftActiveCount == 50 then
				npc.FireAIEvent(2001, 0, 0)
			end
	
			if npc.GetBuff(10598, 1).nLeftActiveCount == 45 then
				npc.FireAIEvent(2001, 0, 0)
			end
	
			if npc.GetBuff(10598, 1).nLeftActiveCount == 40 then
				npc.FireAIEvent(2001, 0, 0)
			end
	
			if npc.GetBuff(10598, 1).nLeftActiveCount == 35 then
				npc.FireAIEvent(2001, 0, 0)
			end
	
			if npc.GetBuff(10598, 1).nLeftActiveCount == 30 then
				npc.FireAIEvent(2001, 0, 0)
			end

			if npc.GetBuff(10598, 1).nLeftActiveCount == 25 then
				npc.FireAIEvent(2001, 0, 0)
			end

			if npc.GetBuff(10598, 1).nLeftActiveCount == 20 then
				npc.FireAIEvent(2001, 0, 0)
			end

			if npc.GetBuff(10598, 1).nLeftActiveCount == 15 then
				npc.FireAIEvent(2001, 0, 0)
			end

			if npc.GetBuff(10598, 1).nLeftActiveCount == 10 then
				npc.FireAIEvent(2001, 0, 0)
			end
		end
	end

	if scene.dwMapID == 248 then
		if npc.GetBuff(10598, 2) then
			if npc.GetBuff(10598, 2).nLeftActiveCount == 55 then
				npc.FireAIEvent(2001, 0, 0)
			end
	
			if npc.GetBuff(10598, 2).nLeftActiveCount == 50 then
				npc.FireAIEvent(2001, 0, 0)
			end
	
			if npc.GetBuff(10598, 2).nLeftActiveCount == 45 then
				npc.FireAIEvent(2001, 0, 0)
			end
	
			if npc.GetBuff(10598, 2).nLeftActiveCount == 40 then
				npc.FireAIEvent(2001, 0, 0)
			end
	
			if npc.GetBuff(10598, 2).nLeftActiveCount == 35 then
				npc.FireAIEvent(2001, 0, 0)
			end
	
			if npc.GetBuff(10598, 2).nLeftActiveCount == 30 then
				npc.FireAIEvent(2001, 0, 0)
			end

			if npc.GetBuff(10598, 2).nLeftActiveCount == 25 then
				npc.FireAIEvent(2001, 0, 0)
			end

			if npc.GetBuff(10598, 2).nLeftActiveCount == 20 then
				npc.FireAIEvent(2001, 0, 0)
			end

			if npc.GetBuff(10598, 2).nLeftActiveCount == 15 then
				npc.FireAIEvent(2001, 0, 0)
			end

			if npc.GetBuff(10598, 2).nLeftActiveCount == 10 then
				npc.FireAIEvent(2001, 0, 0)
			end
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com