---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/春明门/春明门_严庄_进地牢监控.lua
-- 更新时间:	2014/5/26 16:58:44
-- 更新用户:	ks13376-PC
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	local huadiweilao = scene.GetNpcByNickName("huadiweilao")
	if huadiweilao then
		if GetCharacterDistance(huadiweilao.dwID, player.dwID) <= 192 then
			if player.nMoveState ~= MOVE_STATE.ON_DEATH then
				if not player.GetBuff(7874, 1) then
					player.AddBuff(0, 99, 7874, 1, 28800)
				end
	
				if player.GetBuff(208, 1) then
					player.DelBuff(208, 1)
				end
	
				if player.GetBuff(1900, 1) then
					player.DelBuff(1900, 1)
				end
	
				if not player.GetBuff(7876, 1) then
					player.AddBuff(0, 99, 7876, 1, 600)
				end
			end
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com