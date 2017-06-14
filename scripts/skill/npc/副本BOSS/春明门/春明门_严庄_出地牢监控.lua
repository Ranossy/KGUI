---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/春明门/春明门_严庄_出地牢监控.lua
-- 更新时间:	2014/5/26 15:55:41
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
	local yanzhuang = scene.GetNpcByNickName("yanzhuang")
	local k = 0
	if huadiweilao then
		if GetCharacterDistance(huadiweilao.dwID, player.dwID) > 208 then
			local playerlist = scene.GetAllPlayer()
			for i = 1, #playerlist do
				local playertarget = GetPlayer(playerlist[i])
				if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
					if GetCharacterDistance(huadiweilao.dwID, playertarget.dwID) <= 192 then
						k = k + 1
					end
				end
			end
	
			if k == 0 then
				player.PlaySfx(553, player.nX, player.nY, player.nZ + 500)
				player.PlaySfx(1018, player.nX, player.nY, player.nZ + 500)
				if yanzhuang then
					yanzhuang.Say(GetEditorString(6, 6123))
				end
				player.Die()
			end
	
			if k ~= 0 then
				player.DelBuff(7876, 1)
				player.DelBuff(7874, 1)
				player.DelBuff(7877, 1)
				player.DelBuff(7878, 1)
			end
		end
	end

	if not huadiweilao then
		player.DelBuff(7876, 1)
		player.DelBuff(7874, 1)
		player.DelBuff(7877, 1)
		player.DelBuff(7878, 1)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com