---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳秀岳/柳秀岳_石化预警.lua
-- 更新时间:	2017/5/9 15:41:57
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<

-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npc = scene.GetNpcByNickName("liuxiuyue")
	if not npc then
		return
	end

	if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if player.GetBuff(11910, 1) then
			local Nbuff = player.GetBuff(11910, 1)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				if not player.GetBuff(11909, 1) then
					player.Stop()
					player.AddBuff(npc.dwID, npc.nLevel, 11909, 1)
					player.DelGroupBuff(11910, 1)
					player.AddBuff(npc.dwID, npc.nLevel, 11949, 1) --禁止复活
				end
			end
		end
	end

	if scene.dwMapID == 270 then
		if player.GetBuff(11910, 2) then
			local Nbuff = player.GetBuff(11910, 2)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				if not player.GetBuff(11909, 2) then
					player.Stop()
					player.AddBuff(npc.dwID, npc.nLevel, 11909, 2)
					player.DelGroupBuff(11910, 2)
					player.AddBuff(npc.dwID, npc.nLevel, 11949, 2) --禁止复活
				end
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com