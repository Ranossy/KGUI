---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/剑毒遗症.lua
-- 更新时间:	2017/4/2 0:53:30
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
	local Nbuff = player.GetBuff(11853, 1)
	local Num = Nbuff.nStackNum
	if linghushang and player and player.bFightState then
		player.DelGroupBuff(11853, 1)
		for i = 1, Num do
			player.AddBuff(player.dwID, player.nLevel, 11849, 1)
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com