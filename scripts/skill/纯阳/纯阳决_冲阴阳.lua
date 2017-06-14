---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/������_������.lua
-- ����ʱ��:	2013/4/22 21:15:50
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ������_������.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  ������
-- ����Ч��  :  ����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Include/Math.lh")

tSkillData = 
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 58}, --level 1
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
		--�������������ض�
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_SRC, -- ħ������
		315, -- ����ֵ1
		1															-- ����ֵ2
	);
   	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/������_������.lua", -- ����ֵ1
		0															-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/90����Ѩ/����ͨ��˲��.lua", -- ����ֵ1
		0															-- ����ֵ2
	);
    
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 237);
	skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	skill.nCostManaBasePercent = 120;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	skill.nMinPrepareFrames  	= 1;
	skill.nPrepareFrames = 16;					-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;		-- ���ܱ���ϵĸ���.����1024
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
function Apply(dwCharacterID)
	local player = nil
	local scene = nil
	local npc = nil
	
	player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	scene = player.GetScene()
	if not scene then
		return
	end
	
	npc = scene.CreateGas(
		dwCharacterID, 4978, 384, 3574,
		619, 1, 0, 0, 0, 0, false,
		160, 1, 8, 0, 0, 0, false,
		0, 0, 0, 0, 0, 0, false,
		0, 0, 0, 0, 0, 0, false,
		325, 1, true,
		0, 0, false,
		0, 0, false,
		0, 0, false)
	npc.SetDisappearFrames(195)
	if npc then
		npc.AddBuff(0, 99, 108, 1, 100)
		player.SetTimer(45, "scripts/skill/����/������_������.lua", npc.dwID, 0)
	end
	player.CastSkillXYZ(4081, 1, npc.nX, npc.nY, npc.nZ)	--��������˫��
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)				-- һ��ʱ�����Ч
	local npc = GetNpc(nParam1)
	if npc then
		npc.SetModelID(3848)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com