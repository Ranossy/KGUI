---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/月华_扰心盾爆炸.lua
-- 更新时间:	2016/9/27 15:09:01
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local table = player.GetAbsorbInfo()
	local scene = player.GetScene()
	if table then
		for k, v in ipairs(table) do
			--	print(v.nAbsorbType)
			--	print(v.nAbsorbValue)
			--	print(v.nAbsorbUsedValue)
			--player.nCurrentLife = player.nCurrentLife - v.nAbsorbUsedValue * 10
			local yuehua = scene.GetNpcByNickName("yuehua")
			if yuehua then
				if v.nAbsorbUsedValue > 0 then
					player.CustomDamage(yuehua.dwID, 16001, 1, 0, v.nAbsorbUsedValue * 0.5)

				end
				player.DelBuff(10771, 1)
			end
		end
	end

end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com