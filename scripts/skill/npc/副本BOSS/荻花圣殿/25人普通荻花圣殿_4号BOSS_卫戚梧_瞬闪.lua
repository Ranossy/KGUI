------------------------------------------------
-- 创建人   :  张豪		
-- 创建时间	:  2011-3-28
-- 效果备注	:  荻花圣殿卫戚梧瞬移技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
    local tPlayer = scene.GetAllPlayer()
    local nNum = Random(1, #tPlayer)
	local player = GetPlayer(tPlayer[nNum])
		if player then
			npc.SetTarget(TARGET.PLAYER, player.dwID)
		end


 local remnu = scene.CreateNpc(13513, npc.nX, npc.nY, npc.nZ, "renmu", 80)
    
    if renmu then
    	renmu.DoAction(0, 10030)
    end

local targetType, targetID = npc.GetTarget()
	
	if targetType == TARGET.PLAYER then
		local player = GetPlayer(targetID)
		if player then
			local x = player.nX
			local y = player.nY
			local z = player.nZ
	
			local nFacePirection = player.nFaceDirection
			
			local X1 = x + math.sin((nFacePirection + 128) % 256 / 256 * math.pi ) * 64 * 4
			local Y1 = y + math.cos((nFacePirection + 128) % 256 / 256 * math.pi ) * 64 * 4
			
			npc.SetPosition(X1, Y1, z)
			npc.CastSkill(2832, 3)			
		end
	end

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com