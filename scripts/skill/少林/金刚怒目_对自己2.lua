---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���ŭĿ_���Լ�2.lua
-- ����ʱ��:	2013/4/24 20:18:08
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	local tlevel = 5
	tplayer.AddBuff(tplayer.dwID, tplayer.nLevel, 3885, tlevel, 24)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com