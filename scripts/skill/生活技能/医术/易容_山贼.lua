function Apply(dwCharacterID)
	local rank = Random(1, 125)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		if rank <= 25 then
			player.SetModelID(1061)--����կɽ��
		elseif rank <= 50 then
			player.SetModelID(9)--��ɽɽ��
		elseif rank <= 75 then
			player.SetModelID(154)--ɽ��СͷĿ
		elseif rank <= 100 then
			player.SetModelID(275)--ǿ�������ɽɽ��
		elseif rank <= 125 then
			player.SetModelID(274)--����ɽɽ��
		end
	end
end

function UnApply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		player.SetModelID(0)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com