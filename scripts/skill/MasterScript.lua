------------------------------------------------
-- �ű�����:	scripts\skill\MasterScript.lua
-- ����ʱ��:	2010.02.24
-- �����û�:	CBG
-- Ч����ע: 	����ѧϰʦͨ�ýű�   ȥ���˶԰׺ŵ����ƣ����2011��1��19��
------------------------------------------------
Include("scripts/Include/LogicConst.lh")

function CanLearnSkill(player, dwSkillID, dwSkillLevel, dwMasterID)
	--Log(player.szName .. "Try Learn Skill, ID: " .. dwSkillID .. " Level: " .. dwSkillLevel .. " From: " .. dwMasterID.."�տ�ʼ");
local tSkillContrast = {
	[1] = {10026, 10062, 10017, 10023, 10024, 10061, 10101, 10076, RELATION_FORCE.PLAYER_TIANCE}, --����ڹ�����Ѫս�⣨ID��10026���������ɣ�ID��10062��
	[2] = {10021, 10028, 10018, 10019, 10088, 10089, 10102, 10036, RELATION_FORCE.PLAYER_WANHUA}, --���ڹ��������Σ�ID��10021�����뾭�׵���ID��10028��
	[3] = {10014, 10015, 10000, 10009, 10011, 10012, 10103, 10077, RELATION_FORCE.PLAYER_CHUNYANG}, --�����ڹ�����ϼ����ID��10014����̫�齣�⣨ID��10015��
	[4] = {10080, 10081, 10068, 10069, 10070, 10072, 10104, 10078, RELATION_FORCE.PLAYER_QIXIU}, --�����ڹ������ľ���ID��10081���������ľ���ID��10080��
	[5] = {10002, 10003, 10031, 10032, 10033, 10034, 10100, 10035, RELATION_FORCE.PLAYER_SHAOLIN}, --�����ڹ���ϴ�辭��ID��10002�����׾�����ID��10003��
	[6] = {10144, 10145, 10146, 10148, 10149, 10150, 10161, 10161, RELATION_FORCE.PLAYER_CANGJIAN}, --�ؽ��ڹ�����ˮ����ID��10144����ɽ�ӽ��⣨ID��10145��
	[7] = {10175, 10176, 10171, 10172, 10173, 10174, 10193, 10194, RELATION_FORCE.PLAYER_WUDU}, --�嶾�ڹ���������ID��10175�����������ID��10176��
	[8] = {10224, 10225, 10216, 10218, 10219, 10220, 10226, 10227, RELATION_FORCE.PLAYER_TANGMEN}, --�����ڹ����������ID��10224�������޹����ID��10225��
	}
	if dwMasterID == 44 then		--�Ե����ܵ�ʦ
		if player.dwForceID == 23 then
			return true
		end
	end						
	
	if dwMasterID == 42 then		--���Ƽ��ܵ�ʦ
		if player.dwForceID == 21 then
			return true
		end
	end
	
	if dwMasterID == 43 then		--���輼�ܵ�ʦ
		if player.dwForceID == 22 then
			return true
		end
	end

	
	if dwMasterID == 1 then			--�򻨼��ܵ�ʦ����
		if player.dwForceID == 2 then
			return true;
		end
	end
	
	if dwMasterID == 2 then			--�򻨼��ܵ�ʦ��˼��
		if player.dwForceID == 2 then
			return true;
		end
	end
	
	if dwMasterID == 3 then			--���ּ��ܵ�ʦ�ۺ�
		if player.dwForceID == 1 then
			return true;
		end
	end
	
	if dwMasterID == 4 then			--���ּ��ܵ�ʦ����
		if player.dwForceID == 1 then
			return true;
		end
	end

	if dwMasterID == 5 then			--�������ܵ�ʦ
		return true;
	end
	
	if dwMasterID == 6 then			--�������ܵ�ʦ
		if player.dwForceID == 4 then
			return true;
		end
	end
	
	if dwMasterID == 7 then			--��߼��ܵ�ʦ
		if player.dwForceID == 3 then
			return true;
		end
	end
	
	if dwMasterID == 8 then			--���Ṧ��ʦ
		if player.dwForceID == 2 then
			return true;
		end
	end

	if dwMasterID == 9 then			--�����Ṧ��ʦ
		if player.dwForceID == 1 then
			return true;
		end
	end

	if dwMasterID == 10 then			--�����Ṧ��ʦ
		if player.dwForceID == 4 then
			return true;
		end
	end
	
	if dwMasterID == 11 then			--����Ṧ��ʦ
		if player.dwForceID == 3 then
			return true;
		end
	end

	if dwMasterID == 12 then			--��߼��ܵ�ʦ
		if player.dwForceID == 3 then
			return true;
		end
	end
	
	if dwMasterID == 13 then			--���㼼�ܵ�ʦ
		if player.dwForceID == 5 then
			return true;
		end
	end

	if dwMasterID == 23 then			--�ؽ����ܵ�ʦ
		if player.dwForceID == 8 then
			return true;
		end
	end

	if dwMasterID == 26 then			--�嶾���ܵ�ʦ
		if player.dwForceID == 6 then
			return true;
		end
	end

	if dwMasterID == 28 then			--���ż��ܵ�ʦ
		if player.dwForceID == 7 then
			return true;
		end
	end

	if dwMasterID == 39 then			--���̼��ܵ�ʦ
		if player.dwForceID == 10 then
			return true;
		end
	end
	
	if dwMasterID == 41 then			--ؤ�＼�ܵ�ʦ
		if player.dwForceID == 9 then
			return true;
		end
	end	
	
	if dwMasterID == 31 then			--���������ּ��ܵ�ʦ
			return true;
	end
	
	if dwMasterID == 32 then			--�������򻨼��ܵ�ʦ
			return true;
	end
	
	if dwMasterID == 33 then			--��������߼��ܵ�ʦ
			return true;
	end
	
	if dwMasterID == 34 then			--�����������ܵ�ʦ
			return true;
	end
	
	if dwMasterID == 35 then			--���������㼼�ܵ�ʦ
			return true;
	end
	
	if dwMasterID == 36 then			--�������嶾���ܵ�ʦ
			return true;
	end
	
	if dwMasterID == 37 then			--���������ż��ܵ�ʦ
			return true;
	end

	if dwMasterID == 38 then			--���������ż��ܵ�ʦ
			return true;
	end

	if dwMasterID == 40 then			--���������̼��ܵ�ʦ
			return true;
	end
	
	if dwMasterID == 14 then			--��Ӫ��߼��ܵ�ʦ
		if player.nLevel >= 60 then 		--�ǰ׺�,60������

			if player.dwForceID == 3 then 						--����Լ�����ѧϰ
				return true;
			end
			
			for i = 1, 8 do 									--֮ǰѧ���κ�һ������ڹ�������·�Ŀ���ѧ
				if player.GetSkillLevel(tSkillContrast[1][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--��¼�����ѧ���������ڹ�����
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--�����书��������3�ģ�����ѧϰ��һ�����ɵ��书
				return true;
			end

		end
	end

	if dwMasterID == 15 then			--��Ӫ�򻨼��ܵ�ʦ
		if player.nLevel >= 60 then 		--�ǰ׺�,60������

			if player.dwForceID == 2 then 						--���Լ�����ѧϰ
				return true;
			end
			
			for i = 1, 8 do 									--֮ǰѧ���κ�һ�����ڹ�������·�Ŀ���ѧ
				if player.GetSkillLevel(tSkillContrast[2][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--��¼�����ѧ���������ڹ�����
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--�����书��������3�ģ�����ѧϰ��һ�����ɵ��书
				return true;
			end

		end
	end
	
	if dwMasterID == 16 then			--��Ӫ���㼼�ܵ�ʦ
		if player.nLevel >= 60 and player.nGender == 2 then 		--�ǰ׺�,60������,Ů�Խ�ɫ

			if player.dwForceID == 5 then 						--�����Լ�����ѧϰ
				return true;
			end
			
			for i = 1, 8 do 									--֮ǰѧ���κ�һ�������ڹ�������·�Ŀ���ѧ
				if player.GetSkillLevel(tSkillContrast[4][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--��¼�����ѧ���������ڹ�����
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--�����书��������3�ģ�����ѧϰ��һ�����ɵ��书
				return true;
			end

		end
	end

	if dwMasterID == 17 then			--��Ӫ�������ܵ�ʦ
		if player.nLevel >= 60 then 		--�ǰ׺�,60������

			if player.dwForceID == 4 then 						--�����Լ�����ѧϰ
				return true;
			end
			
			for i = 1, 8 do 									--֮ǰѧ���κ�һ�������ڹ�������·�Ŀ���ѧ
				if player.GetSkillLevel(tSkillContrast[3][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--��¼�����ѧ���������ڹ�����
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--�����书��������3�ģ�����ѧϰ��һ�����ɵ��书
				return true;
			end

		end
	end

	if dwMasterID == 18 then			--��Ӫ���ּ��ܵ�ʦ
		if player.nLevel >= 60 and player.nGender == 1 then 		--�ǰ׺�,60������,���Խ�ɫ

			if player.dwForceID == 1 then 						--�����Լ�����ѧϰ
				return true;
			end
			
			for i = 1, 8 do 									--֮ǰѧ���κ�һ�������ڹ�������·�Ŀ���ѧ
				if player.GetSkillLevel(tSkillContrast[5][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--��¼�����ѧ���������ڹ�����
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--�����书��������3�ģ�����ѧϰ��һ�����ɵ��书
				return true;
			end

		end
	end
	
	if dwMasterID == 25 then			--��Ӫ�ؽ����ܵ�ʦ
		if player.nLevel >= 60 then 		--�ǰ׺�,60������

			if player.dwForceID == 8 then 						--�ؽ��Լ�����ѧϰ
				return true;
			end
			
			for i = 1, 8 do 									--֮ǰѧ���κ�һ���ؽ��ڹ�������·�Ŀ���ѧ
				if player.GetSkillLevel(tSkillContrast[6][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--��¼�����ѧ���������ڹ�����
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--�����书��������3�ģ�����ѧϰ��һ�����ɵ��书
				return true;
			end

		end
	end

	if dwMasterID == 22 then			--���ִ���ѧѵ��ʦ
		Log(player.szName .. "Try Learn Skill, ID: " .. dwSkillID .. " Level: " .. dwSkillLevel .. " From: " .. dwMasterID..GetEditorString(2, 8034));
		return true;
	end

	
	if dwMasterID == 27 then			--��Ӫ�嶾���ܵ�ʦ
		if player.nLevel >= 60 then 		--�ǰ׺�,60������

			if player.dwForceID == 6 then 						--�嶾�Լ�����ѧϰ
				return true;
			end
			
			for i = 1, 8 do 									--֮ǰѧ���κ�һ���嶾�ڹ�������·�Ŀ���ѧ
				if player.GetSkillLevel(tSkillContrast[7][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--��¼�����ѧ���������ڹ�����
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--�����书��������3�ģ�����ѧϰ��һ�����ɵ��书
				return true;
			end

		end
	end

	if dwMasterID == 29 then			--��Ӫ���ż��ܵ�ʦ
		if player.nLevel >= 60 then 		--�ǰ׺�,60������

			if player.dwForceID == 7 then 						--�����Լ�����ѧϰ
				return true;
			end
			
			for i = 1, 8 do 									--֮ǰѧ���κ�һ�������ڹ�������·�Ŀ���ѧ
				if player.GetSkillLevel(tSkillContrast[8][i]) > 0 then 		
					return true;
				end
			end
			
			local nPLayerSkillTpye = 1			--��¼�����ѧ���������ڹ�����
			for i = 1, 6 do 
				for j = 1, 8 do 
					if player.GetSkillLevel(tSkillContrast[i][j]) > 0 and tSkillContrast[i][9] ~= player.dwForceID then
						nPLayerSkillTpye = nPLayerSkillTpye + 1
						break
					end
				end
			end
			
			if nPLayerSkillTpye < 3 then						--�����书��������3�ģ�����ѧϰ��һ�����ɵ��书
				return true;
			end

		end
	end
    return false;
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com