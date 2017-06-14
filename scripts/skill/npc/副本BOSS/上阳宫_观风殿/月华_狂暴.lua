---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/月华_狂暴.lua
-- 更新时间:	2016/10/2 17:20:20
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	local scene = npc.GetScene()
	if scene then
		local tPlayer = scene.GetAllPlayer()
		for i = 1, #tPlayer do
			local playertar = GetPlayer(tPlayer[i])
			if playertar and playertar.nMoveState ~= MOVE_STATE.ON_DEATH then
				npc.PlaySfx(1425, playertar.nX, playertar.nY, playertar.nZ)
				playertar.CustomDamage(npc.dwID, 16506, 1, 0, playertar.nMaxLife * 10)
				playertar.Die()
			end
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com