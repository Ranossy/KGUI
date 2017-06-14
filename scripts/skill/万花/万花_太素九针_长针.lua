---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_̫�ؾ���_����.lua
-- ����ʱ��:	2013/6/20 23:17:18
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_̫�ؾ���_����.lua
-- ������    :  ���	
-- ����ʱ��  :  2008-08-20
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  
-- �书��·  :  ̫�ؾ���
-- ��������  :  ����
-- ����Ч��  :  ֱ�Ӵ�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nTherapyBase = 503, nTherapyRand = 50, nCostMana = 199 * 0.9},
	{ nTherapyBase = 539, nTherapyRand = 54, nCostMana = 294 * 0.9},
	{ nTherapyBase = 575, nTherapyRand = 58, nCostMana = 370 * 0.9},
	{ nTherapyBase = 611, nTherapyRand = 61, nCostMana = 442 * 0.9},
	{ nTherapyBase = 647, nTherapyRand = 65, nCostMana = 518 * 0.9},
	{ nTherapyBase = 683, nTherapyRand = 68, nCostMana = 591 * 0.9},
	{ nTherapyBase = 719, nTherapyRand = 72, nCostMana = 591 * 0.9},
	{ nTherapyBase = 755, nTherapyRand = 76, nCostMana = 591 * 0.9},
	{ nTherapyBase = 791, nTherapyRand = 79, nCostMana = 199 * 0.9},
	{ nTherapyBase = 827, nTherapyRand = 83, nCostMana = 294 * 0.9},
	{ nTherapyBase = 863, nTherapyRand = 86, nCostMana = 370 * 0.9},
	{ nTherapyBase = 899, nTherapyRand = 90, nCostMana = 442 * 0.9},
	{ nTherapyBase = 935, nTherapyRand = 94, nCostMana = 518 * 0.9},
	{ nTherapyBase = 971, nTherapyRand = 97, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1007, nTherapyRand = 101, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1043, nTherapyRand = 104, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1079, nTherapyRand = 108, nCostMana = 199 * 0.9},
	{ nTherapyBase = 1115, nTherapyRand = 112, nCostMana = 294 * 0.9},
	{ nTherapyBase = 1151, nTherapyRand = 115, nCostMana = 370 * 0.9},
	{ nTherapyBase = 1187, nTherapyRand = 119, nCostMana = 442 * 0.9},
	{ nTherapyBase = 1223, nTherapyRand = 122, nCostMana = 518 * 0.9},
	{ nTherapyBase = 1259, nTherapyRand = 126, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1295, nTherapyRand = 130, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1331, nTherapyRand = 133, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1367, nTherapyRand = 137, nCostMana = 442 * 0.9},
	{ nTherapyBase = 1403, nTherapyRand = 140, nCostMana = 518 * 0.9},
	{ nTherapyBase = 1439, nTherapyRand = 144, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1475, nTherapyRand = 148, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1511, nTherapyRand = 150, nCostMana = 591 * 0.9},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
   	
	----------------- ħ������ -------------------------------------------------
	--ʩ�� �Ӽ���_�������󷨵�����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		108,
		1
	);
   	
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1587,										
--		1
--	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��˲��buff
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		6266,
		1																
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3038,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_̫�ؾ���_����.lua",
		0
	);	

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 126, 1)			-- ����Buff  dwSkillLevel��ע����ȼ�һ��
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(1, 592, 1);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444)
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�������ע������ܵȼ�һ��
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 420*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 420*0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 420*0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 420*0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 420;	-- �������ĵ�����
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 20 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 56;				-- ����֡��
	skill.nChannelInterval = 173; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID)  then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end

	--ͨ��ɾ��˲��buff
	if player.GetBuff(412, 1) then
		--ɾˮ��
		player.DelBuff(412, 1)
	elseif player.GetBuff(932, 1) then
		--ɾ��Ѹӿ
		player.DelBuff(932, 1)
	elseif player.GetBuff(6266, 1) then
		player.DelBuff(6266,1)
	end
	
	local lv = player.GetSkillLevel(142)

	--�����Ŀ��С�ӽ�������hot
	if player.GetSkillLevel(14659) == 1 then
		local nlev = player.GetSkillLevel(101)
		if nlev ~= 0 then
			local nbuff_wozhen = target.GetBuffByOwner(631, nlev, player.dwID)
			if nbuff_wozhen then
				player.CastSkill(14660, nlev, player.GetSkillTarget())
			end
		end
	end

	--���뽦��AOE
	if player.GetSkillLevel(5776) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5669, 1)
		player.CastSkillXYZ(6103, lv, target.nX, target.nY, target.nZ)
		--player.PlaySfx(478, target.nX, target.nY, target.nZ + 500)
		player.PlaySfx(477, target.nX, target.nY, target.nZ)
	end

	--���������
	if player.GetSkillLevel(5786) == 1 then
		--player.AddBuff(dwCharacterID, player.nLevel, 6253, 1, 1)
		--if player.GetBuff(6253, 1).nStackNum == 5 then
		if not player.GetBuff(6252, 1) then
			player.AddBuff(dwCharacterID, player.nLevel, 10739, 1, 1)
			--player.AddBuff(dwCharacterID, player.nLevel, 6252, 1, 1)
		end
		--end
	end

	--���븽������
	local lv1 = player.GetSkillLevel(132)	--����
	if player.GetSkillLevel(5789) == 1 then
		if not target.GetBuff(6415, 1) then
			if not target.GetBuff(7734,1) then
				if player.GetSkillLevel(5779) == 1 then
					target.AddBuff(player.dwID, player.nLevel, 6264, lv1, 1)	--��ǿ����
				else
					target.AddBuff(player.dwID, player.nLevel, 122, lv1, 1)		--��������
				end
			end
			target.AddBuff(player.dwID, player.nLevel, 6415, 1, 1)	--2������CD
		end
	end
	--player.DelBuff(6266, 1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com