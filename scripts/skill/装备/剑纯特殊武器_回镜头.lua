---------------------------------------------------------------------->
-- �ű�����:	F:/zhugan/client/scripts/skill/װ��/������������_�ؾ�ͷ.lua
-- ����ʱ��:	2013/1/30 15:09:47
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)

end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if nLeftFrame ~= 0 then
		player.PlayCameraAnimation(0, 0)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com