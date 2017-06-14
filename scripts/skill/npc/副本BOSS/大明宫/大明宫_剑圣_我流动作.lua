------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-7-26
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	npc.DoAction(0, 10061)
	local scene = npc.GetScene()
	if not scene then
		return
	end
	local tPlayer = scene.GetAllPlayer()
	if tPlayer then
		for i = 1, #tPlayer do
			local player = GetPlayer(tPlayer[i])
			if player then
				if not player.GetBuff(5973, 1) then
					player.AddBuff(0, 99, 6730, 1)
					npc.PlaySfx(442, player.nX, player.nY, player.nZ)
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com