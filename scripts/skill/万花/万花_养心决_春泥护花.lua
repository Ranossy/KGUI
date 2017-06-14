---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_���ľ�_���໤��.lua
-- ����ʱ��:	2013/6/3 16:42:23
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_���ľ�_���໤��.lua
-- ������    :  ���	
-- ����ʱ��  :  2008-08-18
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ���ľ�
-- ��������  :  ���໤��
-- ����Ч��  :  ���ѷ��ڹ����ܣ����ܳ���ʱ���ڼ��ٳ��25%������30��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 133}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 215}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 280}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 348}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 413}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 480}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 545}, --level 7
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------

	   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,
		193,
		0											
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_���ľ�_���໤��.lua", -- ��Э��
		0
	);
		
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	skill.AddSlowCheckDestBuff(1674, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 122, dwSkillLevel, false, 5)			-- ����Buff
	skill.BindBuff(2, 1674, 1);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	skill.SetNormalCoolDown(1, 53);
	skill.SetCheckCoolDown(1, 444)
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostRage		= 0;									-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	skill.nCostManaBasePercent = 508;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
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
	--skill.bIsFormationSkill		= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3830)
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not target then
		return
	end
	local i
	local lv = player.GetSkillLevel(132)
	
	if player.GetSkillLevel(9145) == 1 then
		for i = 1, 5 do 
			target.AddBuff(dwSkillSrcID, player.nLevel, 6256, 1, 1)	--����5�㴺��
		end
	elseif  player.GetSkillLevel(5770) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6257, 1, 1)	--�������8��û����
	elseif player.GetSkillLevel(5779) == 1 then
		for i = 1, 5 do 
			target.AddBuff(dwSkillSrcID, player.nLevel, 6264, lv, 1)	--20%��ǿЧ��
		end
	else
		for i = 1, 5 do 
			target.AddBuff(dwSkillSrcID, player.nLevel, 122, lv, 1)		--��������
		end
	end

	--�������е�Ѫ��Ŀ�꽵��10���Ϣʱ��
	if player.GetSkillLevel(16853) == 1 and target.nCurrentLife <= target.nMaxLife * 0.5 then
		player.ModifyCoolDown(53, - 160)
	end

	--������ʩչ���༼�ܵ�Ϣʱ�併��6��
	if player.GetSkillLevel(5765) == 1 and dwSkillSrcID ~= dwCharacterID then
		player.CastSkill(14650, 1)	--����6���Ϣʱ��
		ModityCDToUI(player, 132, 0, 0)
	end

	--����Ŀ���Ѫ����5%
	if player.GetSkillLevel(6687) == 1 then
		if not target.GetBuff(7913, 1) and target.dwShapeShiftID == 0 then
			target.nCurrentLife = target.nCurrentLife + target.nMaxLife * 0.05
			target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 0.05
		end
	end

	--�����Ѫ
	if player.GetSkillLevel(5778) == 1 then
		--target.nCurrentLife = target.nCurrentLife + target.nMaxLife * 0.05
		target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 0.05
	end

	ModityCDToUI(player, 132, 0, 0)
	player.SetTimer(1, "scripts/skill/��/��_���ľ�_���໤��.lua", 0, 0)
	--ModityCDToUI(player, 228, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	ModityCDToUI(player, 228, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com