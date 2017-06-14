---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/绝症.lua
-- 更新时间:	2017/4/2 0:52:04
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
	if player.nCurrentLife > 0 then
		if player.nCurrentLife >= player.nMaxLife * 0.3 then
			player.nCurrentLife = player.nCurrentLife - player.nMaxLife * 0.3
		else	
		player.nCurrentLife = 0
		end
	end
	if player.nCurrentMana > 0 then
		if player.nCurrentMana >= player.nMaxMana * 0.3 then
			player.nCurrentMana = player.nCurrentMana - player.nMaxMana * 0.3
		else	
		player.nCurrentMana = 0
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com