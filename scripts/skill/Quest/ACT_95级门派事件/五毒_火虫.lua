--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	--������Ҵ�
	local playerNumber = 1

	
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return 
	end
	player.SitDown()
	
	local scene = player.GetScene()
	if not scene then
		return
	end

	--����������ٻ����󷨣���ɾ���ٻ�������
	for i = 1,5 do
		local doodadthis = scene.GetDoodadByNickName("WuduPQ95" .. tostring(dwSkillSrcID) .. tostring(i))
		if doodadthis then
			player.PlaySfx(244,doodadthis.nX,doodadthis.nY,doodadthis.nZ)
			doodadthis.SetDisappearFrames(1,1)
		end
	end


	---���ٻ�
	for i = 1, playerNumber do
		local nickNameString = "WuduPQ95"..tostring(dwSkillSrcID)..tostring(i)
		local posX = player.nX + (3 * 64) * math.cos( 2 * math.pi  *  ( i - 1 ) / playerNumber )
		local posY = player.nY + (3 * 64) * math.sin( 2 * math.pi  *  ( i - 1 ) / playerNumber )
		local posZ = player.nZ
		
		local thisDoodad = scene.CreateDoodad(5976, posX, posY, posZ, 1, nickNameString )
		thisDoodad.SetCustomInteger4(1, tonumber(dwSkillSrcID)) -- �����ٻ���ID
		thisDoodad.SetCustomInteger4(5, tonumber(dwSkillSrcID)) -- ����Ĭ�ϲٿ���Ϊ�ٻ���
		thisDoodad.SetDisappearFrames(960)
		player.PlaySfx(244,posX,posY,posZ)
	end
	
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com