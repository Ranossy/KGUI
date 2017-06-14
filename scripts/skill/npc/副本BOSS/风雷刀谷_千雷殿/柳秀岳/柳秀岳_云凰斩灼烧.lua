---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳秀岳/柳秀岳_云凰斩灼烧.lua
-- 更新时间:	2017/3/10 17:51:25
-- 更新用户:	CHENGSIHAN
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
	--[[if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if player.GetBuff(11804, 1) then
			local Nbuff = player.GetBuff(11804, 1)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				npc.CastSkillXYZ(17467, 1, player.nX, player.nY, player.nZ)		--炸团AOE
				npc.CastSkill(17493, 1, TARGET.PLAYER, player.dwID)		--灼烧结算单体高伤
				player.DelGroupBuff(11804, 1)
			end
		end
	else
		if player.GetBuff(11804, 2) then
			local Nbuff = player.GetBuff(11804, 2)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				npc.CastSkillXYZ(17467, 2, player.nX, player.nY, player.nZ)		--炸团AOE
				npc.CastSkill(17493, 2, TARGET.PLAYER, player.dwID)		--灼烧结算单体高伤
				player.DelGroupBuff(11804, 2)
			end
		end
	end--]]
	if scene.dwMapID == 270 then
		if player.GetBuff(11804, 2) then
			local Nbuff = player.GetBuff(11804, 2)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				npc.CastSkillXYZ(17467, 2, player.nX, player.nY, player.nZ)		--炸团AOE
				npc.CastSkill(17493, 2, TARGET.PLAYER, player.dwID)		--灼烧结算单体高伤
				player.DelGroupBuff(11804, 2)
			end
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com