------------------------------------------------
-- ������   :  CBG
-- ����ʱ��	:  2010-12-8
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 1
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
		"skill/�嶾/�嶾_���Ԧ��_������.lua",				-- ����ֵ1
		0														-- ����ֵ2
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- Ů洲��첻����
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 392);
	--skill.SetNormalCoolDown(2, 387);					--���﹫��CD10��
	skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	skill.nCostManaBasePercent = 218;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
	----------------- ���˴��������� -------------------------------------------------
	skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene();
		local npc = GetNpc(player.dwPetID)
		local PI = 3.1416;
		local nAngel = PI / 2;
		local nR = 100;
		local nDir = player.nFaceDirection;
		local scene = player.GetScene();
		local nX, nY, nZ = player.GetAbsoluteCoordinate();
		local dwAngel = (player.nFaceDirection * 1.4 - 90) / 180 * PI + nAngel;
		local nCX = nX + nR * math.cos(dwAngel);
		local nCY = nY + nR * math.sin(dwAngel);
                   
		if npc then
			scene.DestroyNpc(npc.dwID)
		end
		local nResault = player.CastSkillXYZ(4062,1,nCX,nCY,nZ)		--�ж����ǰ��λ���Ƿ���3D�ϰ������ޣ����ٳ�����ǰ�������У����ٳ���������λ��
		local pet = nil
		if nResault == 1 then 
			local pet = scene.CreatePet(9997, nCX, nCY, nZ, nDir, -1, dwCharacterID);
			pet.AddBuff(pet.dwID, pet.nLevel, 2565, 5)
			player.CastSkill(3041, 1, TARGET.NPC, pet.dwID)			--Ϊ�������������Ч��
			player.CastSkill(2978, 1, TARGET.NPC, pet.dwID)			--Ϊ�����Ϲ�������Ч��
			pet.nCurrentLife = pet.nMaxLife
			if player.GetSkillLevel(6619) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6216, 1)
			end
			if player.GetSkillLevel(2955) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6219, 1)
			end
			if player.GetSkillLevel(6636) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6222, 1)
			end
			if player.GetSkillLevel(6637) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6225, 1)
			end
			if player.GetSkillLevel(6658) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6238, 1)
				player.AddBuff(player.dwID,player.nLevel,6237,1)
			end
			--[[
			if player.GetSkillLevel(6670) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6244, 1)
			end
			--]]
			if player.GetSkillLevel(6881) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6219, 1)
			end
			if player.GetSkillLevel(14863) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 10128, 1)
			end
		else
			local pet = scene.CreatePet(9997, nX, nY, nZ, nDir, -1, dwCharacterID);
			pet.AddBuff(pet.dwID, pet.nLevel, 2565, 5)
			player.CastSkill(3041, 1, TARGET.NPC, pet.dwID)			--Ϊ�������������Ч��
			player.CastSkill(2978, 1, TARGET.NPC, pet.dwID)			--Ϊ�����Ϲ�������Ч��
			pet.nCurrentLife = pet.nMaxLife
			if player.GetSkillLevel(6619) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6216, 1)
			end
			if player.GetSkillLevel(2955) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6219, 1)
			end
			if player.GetSkillLevel(6636) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6222, 1)
			end
			if player.GetSkillLevel(6637) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6225, 1)
			end
			if player.GetSkillLevel(6658) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6238, 1)
				player.AddBuff(player.dwID,player.nLevel,6237,1)
			end
			if player.GetSkillLevel(6670) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6244, 1)
			end
			if player.GetSkillLevel(6881) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 6219, 1)
			end
			if player.GetSkillLevel(14863) == 1 then
				pet.AddBuff(pet.dwID, pet.nLevel, 10128, 1)
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com