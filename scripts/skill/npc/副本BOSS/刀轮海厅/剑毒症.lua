---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/剑毒症.lua
-- 更新时间:	2017/4/1 22:40:18
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
	local linghushang = scene.GetNpcByNickName("linghushang")
	if linghushang and player and player.bFightState then
		if player.GetBuff(11849, 1) then
			local Nbuff = player.GetBuff(11849, 1)
			local Num = Nbuff.nStackNum
			if Num >= 10 and Num < 15 then
				if not player.GetBuff(11850, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11850, 1)
				end
				if not player.GetBuff(11791, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11791, 1)
				end
			end
			if Num >= 15 and Num < 20 then
				player.DelBuff(11850, 1)
				if not player.GetBuff(11851, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11851, 1)
				end
				if not player.GetBuff(11791, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11791, 1)
				end
			end
			if Num == 20 then
				player.DelBuff(11851, 1)
				if not player.GetBuff(11852, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11852, 1)
				end
				if not player.GetBuff(11791, 1) then
					player.AddBuff(player.dwID, player.nLevel, 11791, 1)
				end
			end
		end
	end
end
-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com