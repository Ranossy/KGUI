---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_老无名_卦劲_结束消失.lua
-- 更新时间:	2013/9/3 14:25:13
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<

local tDoodad = {
	[1] = 4489,		--乾
	[2] = 4490,		--坤
	[3] = 4491,		--坎
	[4] = 4492, 		--离
	[5] = 4493,		--艮
	[6] = 4494,		--震
	[7] = 4495,		--巽
	[8] = 4496,		--兑
}
	
local tBUFF = {
	[1] = 6681,		--乾
	[2] = 6682,		--坤
	[3] = 6683,		--坎
	[4] = 6684, 		--离
	[5] = 6685,		--艮
	[6] = 6686,		--震
	[7] = 6687,		--巽
	[8] = 6688,		--兑
}

--------------脚本文件开始------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if player.GetBuff(6666, 1) then
		player.DelBuff(6666, 1)
	end
	if player.GetBuff(6666, 2) then
		player.DelBuff(6666, 2)
	end
	local npcBoss = scene.GetNpcByNickName("wuming")
	if scene.dwMapID == 177 then
		for i = 1, 8 do
			if tBUFF[i] == BuffID then
				local doodadthis = scene.GetDoodadByNickName("guajin_" .. i)
				local npcthis = scene.GetNpcByNickName("guajinbiaoxian_" .. i)
				if npcthis then
					if not doodadthis then
						if npcBoss and npcBoss.GetCustomBoolean(12) == true then
							scene.CreateDoodad(tDoodad[i], npcthis.nX, npcthis.nY, npcthis.nZ, 0, "guajin_" .. i)
							player.SetDynamicSkillGroup(0)
							return
						end
					end
				end
			end
		end
	elseif scene.dwMapID == 178 then
		for i = 1, 8 do
			if tBUFF[i] == BuffID then
				local doodadthis = scene.GetDoodadByNickName("guajin_" .. nCustomValue .. "_" .. i)
				local npcthis = scene.GetNpcByNickName("guajinbiaoxian_" .. i)
				if npcthis then
					if not doodadthis then
						if npcBoss and npcBoss.GetCustomBoolean(12) == true then
							doodadthis = scene.CreateDoodad(tDoodad[i], npcthis.nX, npcthis.nY, npcthis.nZ, 0, "guajin_" .. nCustomValue .. "_" .. i)
							doodadthis.SetCustomInteger1(1, nCustomValue)
							player.SetDynamicSkillGroup(0)
							return
						end
					end
				end
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com