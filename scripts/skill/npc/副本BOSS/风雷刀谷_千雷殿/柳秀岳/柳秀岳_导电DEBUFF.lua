---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳秀岳/柳秀岳_导电DEBUFF.lua
-- 更新时间:	2017/5/9 16:23:40
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
	local nRan = Random(10000)
	if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if nRan <= 5000 then
			if not player.GetBuff(11909, 1) then
				player.Stop()
				player.AddBuff(npc.dwID, npc.nLevel, 11783, 1)
			end
		end
		npc.CastSkillXYZ(17607, 1, player.nX, player.nY, player.nZ)
	else
		if nRan <= 5000 then
			if not player.GetBuff(11909, 2) then
				player.Stop()
				player.AddBuff(npc.dwID, npc.nLevel, 11783, 2)
			end
		end
		npc.CastSkillXYZ(17607, 2, player.nX, player.nY, player.nZ)
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com