---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/重症.lua
-- 更新时间:	2017/4/2 0:32:03
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
	local npc = scene.GetNpcByNickName("linghushang")
	local nRan = Random(10000)
	if nRan <= 8000 then
		if npc then
			player.AddBuff(npc.dwID, npc.nLevel, 11859, 1)
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com