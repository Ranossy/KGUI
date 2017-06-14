function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nX, nY, nZ = player.GetCoordinateSkillTarget()
	local scene = player.GetScene()
	local dongnantoushiche1 = scene.GetNpcByNickName("dongnantoushiche1")
	local dongnantoushiche2 = scene.GetNpcByNickName("dongnantoushiche2")
	local dongnantoushiche3 = scene.GetNpcByNickName("dongnantoushiche3")
	if dongnantoushiche1 then
		if dongnantoushiche1.GetCustomInteger4(8) == player.dwID then
			dongnantoushiche1.DoAction(0, 10054)
		end
	end
	
	if dongnantoushiche2 then
		if dongnantoushiche2.GetCustomInteger4(8) == player.dwID then
			dongnantoushiche2.DoAction(0, 10054)
		end
	end
	
	if dongnantoushiche3 then
		if dongnantoushiche3.GetCustomInteger4(8) == player.dwID then
			dongnantoushiche3.DoAction(0, 10054)
		end
	end
	player.PlaySfx(575, nX, nY, nZ - 500)
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com