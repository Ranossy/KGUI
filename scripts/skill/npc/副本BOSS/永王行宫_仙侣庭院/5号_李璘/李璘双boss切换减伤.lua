---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Default.lua
-- ����ʱ��:	2015/7/29 14:31:27
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<


--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local thisBoss = GetNpc(dwCharacterID)
	

	if thisBoss and thisBoss.nMoveState ~= MOVE_STATE.ON_DEATH then
		if thisBoss.szName == "LiLin" then
			local scene = thisBoss.GetScene()
			if not scene then
				return
			end
			local otherBoss = scene.GetNpcByNickName("ShiSan")
			if otherBoss then
				otherBoss.AddBuff(0, 99, 10111, 1)			
			end
			
		elseif thisBoss.szName == "ShiSan" then
			local scene = thisBoss.GetScene()
			if not scene then
				return
			end
			local otherBoss = scene.GetNpcByNickName("LiLin")
			if otherBoss then
				otherBoss.AddBuff(0, 99, 10111, 1)
			end
		end
	end
	
	
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com