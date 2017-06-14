---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳鸾旗/柳鸾旗_雷域母buff.lua
-- 更新时间:	2017/2/15 16:49:39
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		local npc = scene.GetNpcByNickName("liuluanqiboss")
		if scene.dwMapID == 264 or scene.dwMapID == 272 then
			if not npc then
				player.DelGroupBuff(11703, 1)
				player.DelBuff(11702, 1)
			end

			if npc and npc.bFightState == false then
				player.DelGroupBuff(11703, 1)
				player.DelBuff(11702, 1)
			end
		
			if npc then
				player.AddBuff(npc.dwID, npc.nLevel, 11703, 1, 300)
			end
		end

		if scene.dwMapID == 270 then
			if not npc then
				player.DelGroupBuff(11703, 2)
				player.DelBuff(11702, 2)
			end

			if npc and npc.bFightState == false then
				player.DelGroupBuff(11703, 2)
				player.DelBuff(11702, 2)
			end
		
			if npc then
				if npc.GetBuff(3819, 1) then
					for i = 1, 2 do
						player.AddBuff(npc.dwID, npc.nLevel, 11703, 2, 300)
					end
				else
					player.AddBuff(npc.dwID, npc.nLevel, 11703, 2, 300)
				end
				if player.GetBuff(11703, 2) then
					if player.GetBuff(11703, 2).nStackNum >= 16 then
						player.Die()
					end
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com